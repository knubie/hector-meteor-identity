require "ruby-ddp-client"

module Hector

  class MeteorIdentityAdapter

    def authenticate(username, password)
      if password == ENV['HECTOR_KEY']
        yield true
      else
        EM.run do
          jupe_client = RubyDdp::Client.new 'jupe.io', 80
          jupe_client.onopen = lambda do |event|
            jupe_client.send '{"msg":"connect", "version":"pre1", "support":["pre1"]}'
          end
          jupe_client.onconnect = lambda do |event|
            jupe_client.call 'login', [{ :password => password, :user => { :username => username } }] do |error, result|
              if result
                yield true
              else
                yield false
              end
            end
          end
        end
      end
    end

    def remember(username, password)
      nil
    end

    def forget(username)
      nil
    end

    def normalize(username)
      username.strip.downcase
    end

  end
end
