# encoding: utf-8
require File.expand_path(File.join('..', 'lib', 'omniauth', 'bonnier_oauth2', 'version'), __FILE__)

Gem::Specification.new do |s|
  s.name        = 'omniauth-bonnier-oauth2'
  s.version     = OmniAuth::BonnierOauth2::VERSION
  s.author       = ["Bonnier Publications - Interactive"]
  s.homepage     = "https://github.com/BenjaminMedia/WhiteAlbum"

  s.description = 'Bonnier OAuth2 strategy for OmniAuth 1.x'
  s.summary     = s.description

  s.add_dependency "omniauth-oauth2"

  s.add_development_dependency 'rake'

  s.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")

  s.require_paths = ['lib']
end
