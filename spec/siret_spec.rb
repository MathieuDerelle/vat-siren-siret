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
end
