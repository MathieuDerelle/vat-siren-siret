require 'spec_helper'

RSpec.describe Vss do
  describe '.vat?' do
    [0, 1, true, false, {}, [], '813454717', 'FR4281345471', 'FR428134547171'].each do |value|
      it "returns false for #{value}" do
        expect(Vss.vat?(value)).to eq(false)
      end
    end

    %w[FR42813454717 FR30803417153].each do |value|
      it "returns true for #{value}" do
        expect(Vss.vat?(value)).to eq(true)
      end
    end
  end

  describe '.to_vat' do
    [0, 1, true, false, {}, [], '8134547174', 'FR428134547175', '8134547170001415', '1813454717000145'].each do |value|
      it "returns false for #{value}" do
        expect(Vss.to_vat(value)).to eq(false)
      end
    end

    it 'converts SIRET to VAT' do
      expect(Vss.to_vat('81345471700014')).to eq('FR42813454717')
      expect(Vss.to_vat('80341715300035')).to eq('FR30803417153')
    end

    it 'converts SIREN to VAT' do
      expect(Vss.to_vat('813454717')).to eq('FR42813454717')
      expect(Vss.to_vat('803417153')).to eq('FR30803417153')
    end

    it 'converts SIREN to VAT' do
      expect(Vss.to_vat('FR42813454717')).to eq('FR42813454717')
      expect(Vss.to_vat('FR30803417153')).to eq('FR30803417153')
    end
  end
end
