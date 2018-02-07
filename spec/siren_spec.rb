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
end
