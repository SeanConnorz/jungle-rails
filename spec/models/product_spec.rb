require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validation" do
    before do
      @Product = Product.new(
        name: "Tiny Sneakers",
        price_cents: 20,
        quantity: 1,
        category_id: 2
      )
    end

    it "Checks that the name exists for a product" do 
      expect(@Product.name).to be_truthy
    end

    it "Checks that the price exists for a product" do 
      expect(@Product.price_cents).to be_truthy
    end

    it "Checks that the quantity exists for a product" do 
      expect(@Product.quantity).to be_truthy
    end

    it "Checks that the category exists for a product" do 
      expect(@Product.category_id).to be_truthy
    end

  end
end
