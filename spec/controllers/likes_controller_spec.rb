require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:my_user) { User.create!(email:"bloc@bloc.com", password: "password", password_confirmation: "password") }
  let(:my_topic) { Topic.create!(user: my_user, title: "my topic") }
  let(:my_bookmark) { Bookmark.create!(user: my_user, topic: my_topic) }


  #
  # describe BookmarkPolicy do
  #   subject { described_class.new(my_user, record) }
  #   let(:record) { Article.create }
  # end

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

  describe "POST create" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end

    it "redirects user to bookmark" do
      post :create, params: { bookmark_id: my_bookmark.id }
      expect(response).to redirect_to([my_bookmark])
    end

  end

  describe "DELETE destroy" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "redirects user to bookmark" do
      my_like = my_user.likes.where(bookmark: my_bookmark).create
      delete :destroy, params: { id: my_like.id }
      expect(response).to redirect_to(my_bookmark)
    end
  end

end
