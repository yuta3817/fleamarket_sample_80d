FactoryBot.define do

  factory :product do
    name                       {"product"}
    detail                     {"product is things to sell"}
    category_id                {"1"}
    brand_id                   {"1"}
    status_id                  {"1"}
    delivery_charge            {"1"}
    prefecture_id              {"1"}
    delivery_date              {"1"}
    price                      {"3700"}
    association :user

    after(:build) do |product|
      product.product_images << build(:product_image, product: product)
    end

  end

  factory :product_image do
    image  {Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/EC2.png"), 'image/png') }
  end

end
