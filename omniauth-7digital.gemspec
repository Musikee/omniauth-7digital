# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth-7digital/version'

Gem::Specification.new do |s|
  s.name        = 'omniauth-7digital'
  s.version     = OmniAuth::SevenDigital::VERSION
  s.authors     = ['Fabio Cantoni']
  s.email       = ['cover@revoc.net']
  s.homepage    = 'https://github.com/Musikee/omniauth-7digital'
  s.description = 'OmniAuth strategy for 7digital'
  s.summary     = s.description
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'omniauth-oauth', '~> 1.1'
  s.add_development_dependency 'bundler', '~> 1.0'
end
