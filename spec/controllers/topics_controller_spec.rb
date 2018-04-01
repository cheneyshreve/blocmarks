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

    it "redirects to the updated topic" do
      new_title = "new title"

      put :update, params: { id: my_topic.id, topic: { title: new_title } }
      expect(response).to redirect_to my_topic
    end
  end

  describe "DELETE destroy" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "deletes the topic" do
      delete :destroy, params: { id: my_topic.id }
      count = Topic.where({id: my_topic.id}).size
      expect(count).to eq 0
    end

    it "redirects to topics index" do
      delete :destroy, params: { id: my_topic.id }
      expect(response).to redirect_to topics_path
    end
  end
end
