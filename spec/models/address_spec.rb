require 'rails_helper'

describe Address do
  describe '#create' do

    it "is invalid without a first_name" do
      address = build(:address, first_name: "")
      address.valid?
      expect(address.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a last_name" do
      address = build(:address, last_name: "")
      address.valid?
      expect(address.errors[:last_name]).to include("を入力してください")
    end

    it "is invalid without a first_name_kana" do
      address = build(:address, first_name_kana: "")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a last_name_kana" do
      address = build(:address, last_name_kana: "")
      address.valid?
      expect(address.errors[:last_name_kana]).to include("を入力してください")
    end

    it "is invalid without a zip_code" do
      address = build(:address, zip_code: "")
      address.valid?
      expect(address.errors[:zip_code]).to include("を入力してください")
    end

    it "is invalid without a prefecture" do
      address = build(:address, prefecture: "")
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "is invalid without a city" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "is invalid without a town" do
      address = build(:address, town: "")
      address.valid?
      expect(address.errors[:town]).to include("を入力してください")
    end

    it "is invalid without a number" do
      address = build(:address, number: "")
      address.valid?
      expect(address.errors[:number]).to include("を入力してください")
    end

    it "is valid without a building" do
      address = build(:address, building: "")
      expect(address).to be_valid
    end


    it "is invalid without a telephone" do
      address = build(:address, telephone: "")
      address.valid?
      expect(address.errors[:telephone]).to include("を入力してください")
    end

  end
end    

