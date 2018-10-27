require 'rails_helper'

describe User, type: :model do

  it "should not validate users without an email address" do
    @user = FactoryBot.build(:user, email: "not_an_email")
    expect(@user).to_not be_valid
  end
  
end

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
