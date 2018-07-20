require 'rails_helper'
require 'devise'

RSpec.describe TopicsController, type: :controller do
  let(:my_user) { User.create!(email:"bloc@bloc.com", password: "password", password_confirmation: "password") }
  let(:my_topic) { Topic.create!(user: my_user, title: "my topic") }

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

  describe "GET #show" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "returns http success" do
      get :show, params: {id: my_topic.id, topic: {title: "my topic", user_id: my_topic.user_id } }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "returns http success" do
      get :new, params: {id: my_topic.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "Post create" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end

    it "redirects back to the new topic" do
      post :create, params: {id: my_topic.id, topic: {title: "my topic"}}
      expect(response).to redirect_to(Topic.last)
    end
  end

  describe "PUT update" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "updates topic with expected attributes" do
      new_title = "new title"

      put :update, params: { id: my_topic.id, topic: { title: new_title } }

      updated_topic = assigns(:topic)
      expect(updated_topic.title).to eq new_title
    end
  end

end
