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

  def siren?(siren)
    match?(REGEXPS[:SIREN], siren) && valid_luhn?(siren)
  end

  def siret?(siret)
    match?(REGEXPS[:SIRET], siret) && valid_luhn?(siret)
  end

  def vat?(_vat)
    # TODO
  end

  module_function :siren?, :siret?, :vat?

  private

  def match?(re, str)
    return re.match?(str) if re.respond_to?(:match?) # ruby >= 2.4
    !(re =~ str).nil?
  end

  def valid_luhn?(string)
    checksum = string.each_char
                     .map(&:to_i)
                     .reverse
                     .each_with_index
                     .sum do |digit, idx|
      tmp = idx.odd? ? digit * 2 : digit
      tmp -= 9 if tmp > 9
      tmp
    end
    (checksum % 10).zero?
  end

  module_function :match?, :valid_luhn?
end
