# French VAT / SIRET / SIREN numbers validation and generation as described here:
# https://fr.wikipedia.org/wiki/Syst%C3%A8me_d%27identification_du_r%C3%A9pertoire_des_%C3%A9tablissements#Calcul_et_validit.C3.A9_d.27un_num.C3.A9ro_SIRET
module Vss
  VERSION = '0.1.0'.freeze

  REGEXPS = {
    SIRET: /^\d{14}$/,
    SIREN: /^\d{9}$/,
    VAT: /^FR\d{11}$/,
    formatSIRET: /^(\d{3})(\d{3})(\d{3})(\d{5})$/,
    formatSIREN: /(\d\d\d\B)/,
    formatVAT: /^([A-Z]{2})(\d{2})(\d{3})(\d{3})(\d{3})$/
  }.freeze

  # Return TRUE if the SIREN is valid
  def self.siren?(siren)
    siren.is_a?(String) && match?(REGEXPS[:SIREN], siren) && valid_luhn?(siren)
  end

  # Return TRUE if the SIRET is valid
  def self.siret?(siret)
    siret.is_a?(String) && match?(REGEXPS[:SIRET], siret) && valid_luhn?(siret)
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
    false
  end

  # Convert a SIREN / SIRET / VAT to a VAT
  def self.to_vat(string)
    return string if vat?(string)
    siren = siret?(string) ? to_siren(string) : string
    return false unless siren?(siren)
    key = vat_key(siren)
    "FR#{key}#{siren}"
  end

  # private methods

  def self.match?(re, str) # :nodoc:
    return re.match?(str) if re.respond_to?(:match?) # ruby >= 2.4
    !(re =~ str).nil?
  end

  # https://fr.wikipedia.org/wiki/Formule_de_Luhn
  def self.valid_luhn?(string) # :nodoc:
    checksum = 0
    string.each_char
          .map(&:to_i)
          .reverse
          .each_with_index do |digit, idx|
      tmp = idx.odd? ? digit * 2 : digit
      tmp -= 9 if tmp > 9
      checksum += tmp
    end
    (checksum % 10).zero?
  end

  def self.valid_vat?(string) # :nodoc:
    siren = string[4..-1]
    vat_key(siren) == string[2..3].to_i && valid_luhn?(siren)
  end

  def self.vat_key(string) # :nodoc:
    (12 + (3 * (string.to_i % 97))) % 97
  end

  private_class_method :match?, :valid_luhn?, :valid_vat?, :vat_key
end
