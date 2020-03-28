require 'spec_helper'

RSpec.describe Vss do
  describe '.siret?' do
    [0, 1, true, false, {}, [], '813454717', 'FR42813454717', '813454717000141', '181345471700014'].each do |value|
      it "returns false for #{value}" do
        expect(Vss.siret?(value)).to eq(false)
      end
    end

    %w[81345471700014 80341715300035].each do |value|
      it "returns true for #{value}" do
        expect(Vss.siret?(value)).to eq(true)
      end
    end
  end

  describe '.format_siret' do
    [0, 1, true, false, {}, [], '813454717', 'FR42813454717', '813454717000141', '181345471700014'].each do |value|
      it "returns nil for #{value}" do
        expect(Vss.format_siret(value)).to eq(nil)
      end
    end

    it 'formats valid SIRET' do
      expect(Vss.format_siret('81345471700014')).to eq('813 454 717 00014')
      expect(Vss.format_siret('80341715300035')).to eq('803 417 153 00035')
    end
  end

  describe '.generate_siret' do
    it 'produces valid SIRET' do
      (0..9).each do
        expect(Vss.siret?(Vss.generate_siret)).to eq(true)
      end
    end
  end
end
