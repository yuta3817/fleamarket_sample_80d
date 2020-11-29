require 'rails_helper'
describe Product do
  describe '#create' do

    it "is invalid without a image" do
      product = build(:product)
      product.product_images << build(:product_image, image: nil)
      product.valid?
      expect(product.errors[:"product_images.image"]).to include("を入力してください")
    end

    it "is invalid without a name" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a detail" do
      product = build(:product, detail: "")
      product.valid?
      expect(product.errors[:detail]).to include("を入力してください")
    end

    it "is invalid without a status_id" do
      product = build(:product, status_id: "")
      product.valid?
      expect(product.errors[:status_id]).to include("を入力してください")
    end

    it "is invalid without a charge_id" do
      product = build(:product, charge_id: "")
      product.valid?
      expect(product.errors[:charge_id]).to include("を入力してください")
    end

    it "is invalid without a prefecture_id" do
      product = build(:product, prefecture_id: "")
      product.valid?
      expect(product.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a delivery_id" do
      product = build(:product, delivery_id: "")
      product.valid?
      expect(product.errors[:delivery_id]).to include("を入力してください")
    end

    it "is invalid without a price" do
      product = build(:product, price: "")
      product.valid?
      expect(product.errors[:price]).to include("を入力してください")
    end
  end
end