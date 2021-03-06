# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redis-copy/version'

Gem::Specification.new do |spec|
  spec.name          = 'redis-copy'
  spec.version       = RedisCopy::VERSION

  authors_and_emails = [['Ryan Biesemeyer', 'ryan@yaauie.com']]
  # authors_and_emails = (`sh git shortlog -sne`).lines.map do |l|
  #   (/(?<=\t)(.+) <(.+)>\z/).match(l.chomp).last(2)
  # end.compact.map(&:to_a)

  spec.authors       = authors_and_emails.map(&:first)
  spec.email         = authors_and_emails.map(&:last)
  spec.summary       = 'Copy the contents of one redis db to another'
  spec.description   = 'A command-line utility built for copying the ' +
                       'contents of one redis db to another over a ' +
                       'network. Supports all data types, persists ttls, ' +
                       'and attempts to be as efficient as possible.'
  spec.homepage      = 'https://github.com/yaauie/redis-copy'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec',   '~> 2.14'

  spec.add_runtime_dependency     'redis'
  spec.add_runtime_dependency     'activesupport'
end
