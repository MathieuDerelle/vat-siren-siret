require 'spec_helper'

RSpec.describe Vss do
  describe '.siren?' do
    [0, 1, true, false, {}, [], '81345471', '8134547171', 'FR42813454717', '81345471700014'].each do |value|
      it "returns false for #{value}" do
        expect(Vss.siren?(value)).to eq(false)
      end
    end

    %w[813454717 803417153].each do |value|
      it "returns true for #{value}" do
        expect(Vss.siren?(value)).to eq(true)
      end
    end
  end

  describe '.to_siren' do
    [0, 1, true, false, {}, [], '81345471', '813454717000141', '181345471700014'].each do |value|
      it "returns false for #{value}" do
        expect(Vss.to_siren(value)).to eq(false)
      end
    end

    it 'converts SIRET to SIREN' do
      expect(Vss.to_siren('81345471700014')).to eq('813454717')
      expect(Vss.to_siren('80341715300035')).to eq('803417153')
    end

    it 'converts VAT to SIREN' do
      expect(Vss.to_siren('FR42813454717')).to eq('813454717')
      expect(Vss.to_siren('FR30803417153')).to eq('803417153')
    end

    it 'converts SIREN to SIREN' do
      expect(Vss.to_siren('813454717')).to eq('813454717')
      expect(Vss.to_siren('803417153')).to eq('803417153')
    end
  end
end
