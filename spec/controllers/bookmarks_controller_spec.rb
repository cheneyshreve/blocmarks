require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:user) { User.create!(email: "email@email.com", password: "password", password_confirmation: "password") }
  let(:topic) { Topic.create!(user: user, title: "topic title") }
  let(:bookmark) {Bookmark.create!(topic: topic, user: user, url: "fancyurl.com") }


  describe "GET #show" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "returns http success" do
      get :show, params: { id: bookmark.id }
      expect(response).to have_http_status(:success)
    end

    it "assigns booksmarks to  @bookmarks" do
      get :show, params: { id: bookmark.id }
      expect(assigns(:bookmark)).to eq(bookmark)
    end
  end

  describe "GET #new" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "returns http success" do
      get :new, params: {topic_id: bookmark.topic_id, bookmark: {url: "some fancy url"} }
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
      get :edit, params: { topic_id: bookmark.topic_id, id: bookmark.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    before(:each) do
       @request.env["devise.mapping"] = Devise.mappings[:user]
       user = FactoryBot.create(:user)
       sign_in user
    end
    it "redirects back to the new topic" do
      post :create, params: {topic_id: bookmark.topic_id, bookmark: {url: "some fancy url"} }
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
      new_url = "new url"

      put :update, params: { id: bookmark.id, topic_id: bookmark.topic_id, bookmark: { url: "new url"} }

      updated_bookmark = assigns(:bookmark)
      expect(updated_bookmark.url).to eq new_url
    end

    it "redirects to the updated topic" do
      new_url = "new url"

      put :update, params: { id: bookmark.id, topic_id: bookmark.topic_id, bookmark: { url: "new url"} }
      expect(response).to redirect_to(Topic.last)
    end
  end

  describe "DELETE destroy" do
  before(:each) do
     @request.env["devise.mapping"] = Devise.mappings[:user]
     user = FactoryBot.create(:user)
     sign_in user
  end

  it "redirects to topic" do
    delete :destroy, params: { id: bookmark.id, topic_id: bookmark.topic_id}
    expect(response).to redirect_to(Topic.last)
  end
end


end
