
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vss'

Gem::Specification.new do |spec|
  spec.name          = 'vat-siren-siret'
  spec.version       = Vss::VERSION
  spec.authors       = ['MathieuDerelle']
  spec.email         = ['mathieu@purchease.com']

  spec.summary       = 'Library to check or generate french VAT / SIRET / SIREN'
  spec.description   = 'Transposition in ruby of the eponymous JS library'
  spec.homepage      = 'https://github.com/MathieuDerelle/vat-siren-siret'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)
  spec.metadata['allowed_push_host'] = 'http://rubygems.org'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'coveralls'
end
