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

    it "assigns topics to @topics" do
      get :index
      expect(assigns(:topics)).to eq([my_topic])
    end
  end

  describe "GET #show" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "returns http success" do
      get :show, params: {id: my_topic.id, topic: {title: "my topic", user: my_user } }
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

  describe "POST create" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end

    it "assigns the new topic to @topic" do
      post :create, params: { topic: {title: my_topic.title, user_id: my_topic.user_id } }
      expect(response).to redirect_to(topic_path)
    end

  end

  describe "GET #edit" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "returns http success" do
      get :edit, params: {id: my_topic.id }
      expect(response).to have_http_status(:success)
    end
  end

end
