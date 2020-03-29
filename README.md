# vat-siren-siret

[![Build Status](https://travis-ci.org/MathieuDerelle/vat-siren-siret.svg?branch=master)](https://travis-ci.org/MathieuDerelle/vat-siren-siret)
[![Coverage Status](https://coveralls.io/repos/github/MathieuDerelle/vat-siren-siret/badge.svg)](https://coveralls.io/github/MathieuDerelle/vat-siren-siret)
[![Gem Version](https://badge.fury.io/rb/vat-siren-siret.svg)](https://badge.fury.io/rb/vat-siren-siret)
[![License](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/MathieuDerelle/vat-siren-siret/blob/master/LICENSE.txt)
[![GitHub pull requests](https://img.shields.io/badge/PR-welcome-green.svg)](https://github.com/MathieuDerelle/vat-siren-siret/pulls)

This library allows to check french VAT, SIRET and SIREN, to generate french VAT, SIRET and SIREN and to generate VAT or SIREN from SIRET, SIREN and VAT.

It has been largely inspired by the [eponymous JS library](https://github.com/jbdemonte/vat-siren-siret) and [the ruby siret gem](https://github.com/samleb/siret)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vat-siren-siret', '~> 0.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vat-siren-siret


## Usage

```
// Check string
Vss.siren?('813454717')      // true
Vss.siret?('81345471700014') // true
Vss.vat?('FR42813454717')    // true

// Generate VAT from SIREN / SIRET
Vss.to_vat('813454717')      // FR42813454717
Vss.to_vat('81345471700014') // FR42813454717

// Generate SIREN from SIRET / VAT
Vss.to_siren('81345471700014') // 813454717
Vss.to_siren('FR42813454717')  // 813454717

// Generate SIREN / SIRET / VAT
Vss.generate_siren // 022676134
Vss.generate_siret // 07577658981212
Vss.generate_vat   // FR60087471512
```


## API

### Vss.siren?(value)

Evaluate if the `value` is a SIREN and return a `boolean`.

### Vss.siret?(value)

Evaluate if the `value` is a SIRET and return a `boolean`.

### Vss.vat?(value)

Evaluate if the `value` is a french VAT and return a `boolean`.

### Vss.to_vat(value)

Generate the french VAT from a SIREN or a SIRET and return a `string` \
Return `nil` when value is neither a SIREN, SIRET or VAT.

### Vss.to_siren(value)

Generate the SIREN from a VAT or a SIRET and return a `string` \
Return `nil` when value is neither a SIREN, SIRET or VAT.

### Vss.generate_siren

Generate a random SIREN passing the luhn check.

### Vss.generate_siret

Generate a random SIRET passing the luhn check.

### Vss.generate_vat

Generate a random VAT passing the luhn check.


## Development

After checking out the repo, run `bin/setup` to install dependencies.
Then, run `rake spec` to run the tests. You can also run `bin/console`
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release`, which will create a git tag
for the version, push git commits and tags, and push the `.gem` file
to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/MathieuDerelle/vat-siren-siret.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
