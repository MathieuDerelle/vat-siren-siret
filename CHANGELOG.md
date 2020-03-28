# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2020-03-28

**breaking changes :**
- drop support for ruby 1.9 (incompatible with rake 12.3.3)
- to_siren/to_vat returns `nil` (instead of `false`) when input string is neither a VAT / SIREN / SIRET
- format_siren/format_siret/format_vat returns `nil` (instead of raising an error) when input string is neither a VAT / SIREN / SIRET

### Added
- gem can be required with "require 'vat-siren-siret'"
- This CHANGELOG file to hopefully serve as an evolving example of a
  standardized open source project CHANGELOG.

### Changed
- update rake (to fix CVE-2020-8130)
- to_siren/to_vat returns `nil` (instead of `false`) when input string is neither a VAT / SIREN / SIRET
- format_siren/format_siret/format_vat returns `nil` (instead of raising an error) when input string is neither a VAT / SIREN / SIRET

### Removed
- support for ruby 1.9

## [0.1.1] - 2018-02-11
### Changed
- rubygems description

## [0.1.0] - 2018-02-08
### Added
- API : Vss namespace with all methods
  (siren?, siret?, vat?, to_siren, to_vat,
  generate_siren, generate_siret, generate_vat,
  format_siren, format_siret, format_vat)
- unit tests

[1.0.0]: https://github.com/olivierlacan/keep-a-changelog/compare/v0.1.1...v1.0.1

[0.1.1]: https://github.com/olivierlacan/keep-a-changelog/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/olivierlacan/keep-a-changelog/releases/tag/v0.1.0
