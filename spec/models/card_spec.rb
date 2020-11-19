require 'rails_helper'
describe Card do
  describe "#create" do
    it "is invalid without a user_id" do
      card = Card.new(
        user_id: "",
        customer_id: "cus_1853ef210c32ec2584ec43cb20e4",
        card_id: "car_64a12d29d61da0f59209fd6a62c3")
      card.valid?
      expect(card.errors[:user_id]).to include("を入力してください")
    end
    it "is invalid duplicate a user_id" do
      user1 = FactoryBot.create(:user, id:1)
      card1 = Card.create(
        id: 1,
        user_id: 1,
        customer_id: "cus_1853ef210c32ec2584ec43cb20e4",
        card_id: "car_64a12d29d61da0f59209fd6a62c3"
      )
      card2 = Card.new(
        id: 2,
        user_id: 1,
        customer_id: "cus_93206befbe997e340b6498c4e758",
        card_id: "car_6bf27c94a777a9ceec51be95dd7f"
      )
      card2.valid?
      expect(card2.errors[:user_id]).to include("はすでに存在します")
    end
  end
end