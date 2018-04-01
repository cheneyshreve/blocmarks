require 'rails_helper'
require 'devise'

RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #about" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

end
