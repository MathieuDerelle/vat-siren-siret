# French VAT / SIRET / SIREN numbers validation and generation as described here:
# https://fr.wikipedia.org/wiki/Syst%C3%A8me_d%27identification_du_r%C3%A9pertoire_des_%C3%A9tablissements#Calcul_et_validit.C3.A9_d.27un_num.C3.A9ro_SIRET
module Vss
  VERSION = '1.0.1'.freeze

  REGEXPS = {
    SIREN: /^\d{9}$/,
    SIRET: /^\d{14}$/,
    VAT: /^FR\d{11}$/,
    formatSIREN: /(\d\d\d\B)/,
    formatSIRET: /^(\d{3})(\d{3})(\d{3})(\d{5})$/,
    formatVAT: /^([A-Z]{2})(\d{2})(\d{3})(\d{3})(\d{3})$/
  }.freeze

  # Return TRUE if the SIREN is valid
  def self.siren?(siren)
    siren.is_a?(String) && match?(REGEXPS[:SIREN], siren) && luhn_valid?(siren)
  end

  # Return TRUE if the SIRET is valid
  def self.siret?(siret)
    siret.is_a?(String) && match?(REGEXPS[:SIRET], siret) && luhn_valid?(siret)
  end

  # Return TRUE if the VAT is valid
  def self.vat?(vat)
    vat.is_a?(String) && match?(REGEXPS[:VAT], vat) && valid_vat?(vat)
  end

  # Convert a SIREN / SIRET / VAT to a SIREN
  def self.to_siren(string)
    return string if siren?(string)
    return string[0..8] if siret?(string)
    return string[4..-1] if vat?(string)

    nil
  end

  # Convert a SIREN / SIRET / VAT to a VAT
  def self.to_vat(string)
    return string if vat?(string)

    siren = siret?(string) ? to_siren(string) : string
    return unless siren?(siren)

    key = vat_key(siren)
    "FR#{format('%02d', key)}#{siren}"
  end

  def self.generate_siren
    complete_for_luhn_checksum(generate_digits(7))
  end

  def self.generate_siret
    complete_for_luhn_checksum(generate_digits(12))
  end

  def self.generate_vat
    to_vat(generate_siren)
  end

  def self.format_siren(siren)
    return unless siren?(siren)

    siren.gsub(REGEXPS[:formatSIREN], '\1 ')
  end

  def self.format_siret(siret)
    return unless siret?(siret)

    siret.gsub(REGEXPS[:formatSIRET], '\1 \2 \3 \4')
  end

  def self.format_vat(vat)
    return unless vat?(vat)

    vat.gsub(REGEXPS[:formatVAT], '\1 \2 \3 \4 \5')
  end

  # private methods

  def self.match?(re, str) # :nodoc:
    return re.match?(str) if re.respond_to?(:match?) # ruby >= 2.4

    !(re =~ str).nil?
  end

  def self.luhn_checksum(string) # :nodoc:
    checksum = 0
    string.each_char
          .map(&:to_i)
          .reverse
          .each_with_index do |digit, idx|
      tmp = idx.odd? ? digit * 2 : digit
      tmp -= 9 if tmp > 9
      checksum += tmp
    end
    checksum
  end

  # https://fr.wikipedia.org/wiki/Formule_de_Luhn
  def self.luhn_valid?(string) # :nodoc:
    (luhn_checksum(string) % 10).zero?
  end

  def self.valid_vat?(string) # :nodoc:
    siren = string[4..-1]
    vat_key(siren) == string[2..3].to_i && luhn_valid?(siren)
  end

  def self.vat_key(string) # :nodoc:
    (12 + (3 * (string.to_i % 97))) % 97
  end

  def self.generate_digits(length)
    format("%0#{length}d", rand(10**(length - 1)))
  end

  def self.complete_for_luhn_checksum(string)
    rest = 10 - luhn_checksum(string) % 10
    a = rest / 3
    b = rest > 2 ? rest - 2 * a : rest
    "#{string}#{a}#{b}"
  end

  private_class_method :match?, :luhn_checksum, :luhn_valid?, :valid_vat?, :vat_key, :generate_digits, :complete_for_luhn_checksum
end
