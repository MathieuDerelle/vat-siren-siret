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
end
