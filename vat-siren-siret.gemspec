lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vss'

Gem::Specification.new do |spec|
  spec.name          = 'vat-siren-siret'
  spec.version       = Vss::VERSION
  spec.authors       = ['MathieuDerelle']
  spec.email         = ['mathieu.derelle@gmail.com']

  spec.summary       = 'Library to check or generate french VAT / SIREN / SIRET'
  spec.description   = 'Library to check or generate french VAT / SIREN / SIRET'
  spec.homepage      = 'https://github.com/MathieuDerelle/vat-siren-siret'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.extra_rdoc_files = ['README.md']

  spec.metadata = {
    'documentation_uri' => 'http://www.rubydoc.info/gems/vat-siren-siret/',
    'source_code_uri'   => 'https://github.com/MathieuDerelle/vat-siren-siret',
    # 'wiki_uri'          => 'https://github.com/MathieuDerelle/vat-siren-siret/wiki',
    # 'changelog_uri'     => 'https://github.com/MathieuDerelle/vat-siren-siret/CHANGELOG.md',
    'ci_uri'            => 'https://travis-ci.org/MathieuDerelle/vat-siren-siret',
    'coverage_uri'      => 'https://coveralls.io/github/MathieuDerelle/vat-siren-siret',
  }

  spec.required_ruby_version = '>= 1.9'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'coveralls'
end
