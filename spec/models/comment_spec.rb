require 'rails_helper'

describe Comment do

  context "when a comment is created" do

    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(email: "test@test.de", password: "password") }

    it "is valid with a product, a rating, a user and a body" do
      expect(Comment.new(product: product, rating: 1, user: user, body: "Awful bike!")).to be_valid
    end

    it "is not valid without a product" do
      expect(Comment.new(rating: 1, user: user, body: "Awful bike!")).not_to be_valid
    end

    it "is not valid without a rating" do
      expect(Comment.new(product: product, user: user, body: "Awful bike!")).not_to be_valid
    end

    it "is not valid without a user" do
      expect(Comment.new(product: product, rating: 1, body: "Awful bike!")).not_to be_valid
    end

    it "is not valid without a body" do
      expect(Comment.new(product: product, rating: 1, user: user)).not_to be_valid
    end

  end

end
