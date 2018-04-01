require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create!(email:"blocuser@bloc.com", password: "password", password_confirmation:"password") }

  describe "attributes" do
    it "has an email attribute" do
      expect(user).to have_attributes(email: "blocuser@bloc.com")
    end

    it "has a password attribute" do
      expect(user).to have_attributes(password: "password")
    end

    it "has a password_confirmation attribute" do
      expect(user).to have_attributes(password_confirmation: "password")
    end
  end

end
