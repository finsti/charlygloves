require 'rails_helper'

describe Order do

  context "when an order is created" do

    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(email: "test@test.de", password: "password") }

    it "is valid with a product and a user" do
      expect(Order.new(product: product, user: user)).to be_valid
    end

    it "is not valid without a product" do
      expect(Order.new(user: user)).not_to be_valid
    end

    it "is not valid without a user" do
      expect(Order.new(product: product)).not_to be_valid
    end

    it "is not valid without a product and a user" do
      expect(Order.new()).not_to be_valid
    end

  end

end
