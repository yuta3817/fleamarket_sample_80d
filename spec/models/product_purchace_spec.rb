require 'rails_helper'
describe ProductPurchase do
  describe "_purchased" do
    it "is invalid without a user_id" do
      purchased = ProductPurchase.new(
        user_id: "",
        product_id: 1
      )
      purchased.valid?
      expect(purchased.errors[:user_id]).to include("を入力してください")
    end
    it "is invalid without a product_id" do
      purchased = ProductPurchase.new(
        user_id: 1,
        product_id: ""
      )
      purchased.valid?
      expect(purchased.errors[:product_id]).to include("を入力してください")
    end
  end
end