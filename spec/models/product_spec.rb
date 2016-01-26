require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe "#margin" do
    let(:product) { FactoryGirl.create(:product) }

    it "calculates margin between wholesale & retail" do
      expect(product.margin).to eq( ( product.retail - product.wholesale ) / product.retail )
    end
  end
  
end
