require 'rails_helper'

describe Product do

  context "when a new product is created" do

    it "is not valid without a name" do
      expect(Product.new(description: "Nice gloves!")).not_to be_valid
    end

  end

  context "when there are products with similar names" do

    before do
      Product.create!(name: "atest")
      Product.create!(name: "btest")
      Product.create!(name: "ctest")
      @product = Product.create!(name: "dtest")
    end

    it "searches correctly and case insensitive" do
      expect(Product.search("D").to_a).to eq [@product]
    end

  end

  context "when the product has comments" do

    let(:product) { Product.create!(name: "race bike") }
    let(:user) { User.create!(email: "test@test.de", password: "password") }

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "returns the highest rating of all comments" do
      expect(product.highest_rating_comment.rating).to eq 5
      expect(product.highest_rating_comment.body).to eq "Great bike!"

    end

    it "returns the lowest rating of all comments" do
      expect(product.lowest_rating_comment.rating).to eq 1
      expect(product.lowest_rating_comment.body).to eq "Awful bike!"
    end

    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq 3.0
    end

  end

end
