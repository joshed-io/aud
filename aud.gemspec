# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "aud/version"

Gem::Specification.new do |s|
  s.name        = "aud"
  s.version     = Aud::VERSION
  s.authors     = "Josh Dzielak"
  s.email       = "jdzielak@gmail.com"
  s.homepage    = "https://github.com/dzello/aud"
  s.summary     = "Audibilize text files"
  s.description = "A command line utility for playing sounds in response to log lines."

  s.add_dependency "thor", '~>0.18'
  s.add_dependency "midi", '~>0.0.9'

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'

  # debuggers
  if /\Aruby/ === RUBY_DESCRIPTION
    s.add_development_dependency 'ruby-debug' if RUBY_VERSION.start_with? '1.8'
    s.add_development_dependency 'debugger'   if RUBY_VERSION.start_with? '1.9'
  end

  s.executable    = 'aud'
  s.files         = Dir.glob('{bin,lib}/**/*') + %w[LICENSE README.md]
  s.require_path  = 'lib'
end
