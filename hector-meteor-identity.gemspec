Gem::Specification.new do |s|
  s.name        = 'hector-meteor-identity'
  s.version     = '0.0.0'
  s.date        = '2013-11-11'
  s.summary     = "A Meteor identity adapter for Hector."
  s.description = "A simple DDP-based identity adapter for the Hector IRC gem."
  s.authors     = ["Matthew Steedman"]
  s.email       = 'steedman87@gmail.com'
  s.files       = ["lib/hector-meteor-identity.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hector-meteor-identity'
  s.license       = 'MIT'

  s.add_dependency "ruby-ddp-client"
end
