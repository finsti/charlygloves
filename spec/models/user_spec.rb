require 'rails_helper'

describe User do

  context "when a user is created" do

      it "is valid with an email and a password" do
        expect(User.new(email: "test@test.de", password: "password")).to be_valid
      end

      it "is not valid without an email" do
        expect(User.new(password: "password")).not_to be_valid
      end

      it "is not valid without a password" do
        expect(User.new(email: "test@test.de")).not_to be_valid
      end

      it "is not valid without an email and a password" do
        expect(User.new()).not_to be_valid
      end

    end
end
