require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validation" do
    before do
      @User = User.create(
        name: "Connor Hughes",
        email: "example@gmail.com",
        password: "1234567",
        password_confirmation: "1234567"
      )

      @InvalidUser = User.create(
        name: "Connor Hughes",
        email: "example@gmail.com",
        password: "123",
        password_confirmation: "123"
      )
    end

    it "user should be invalid without password" do
      @User.password = nil
      expect(@User).to_not be_valid
      expect(@User.errors.full_messages).to include "Password can't be blank"
    end

    it "user should be valid if password and password confirmation match" do
      expect(@User).to be_valid
    end

    it "user should be invalid if password and password confirmation do not match" do
      @User.password_confirmation = "Incorrect"
      expect(@User).to_not be_valid
    end

    it "user should be invalid if email already exists" do
      expect(@InvalidUser).to_not be_valid
    end

    it "user should be invalid if password is less than 6 or greater than 20 characters" do
      expect(@User).to be_valid
      @User.password = "123"
      expect(@User).to_not be_valid
      @User.password = "asdsadasdasfdsgsdgsdsdadgfdgsddafsdgasdsgdssad"
      expect(@User).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    before do
      @User = User.create(
        name: "Connor Hughes",
        email: "example@gmail.com",
        password: "1234567",
        password_confirmation: "1234567"
      )
    end

    it "user should still be authenticated if there are surrounding white spaces" do
      expect(@User.authenticate_with_credentials("  example@gmail.com  ", "1234567")).to be true
    end

    it "user should still be authenticated if there are accidental upper case letters" do
      expect(@User.authenticate_with_credentials("  eXaMple@gmail.com  ", "1234567")).to be true
    end 
  end
end
