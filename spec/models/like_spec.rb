require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.create!(email:"blochead@bloc.com", password: "password", password_confirmation: "password") }
  let(:topic) { Topic.create!(user: user, title: "topic title") }
  let(:bookmark) { Bookmark.create!(topic: topic, user: user) }
  let(:like){ Like.create!(bookmark: bookmark, user: user) }

  it { is_expected.to belong_to(:bookmark) }
  it { is_expected.to belong_to(:user) }

  describe "#like_for(bookmark)" do

  before do
    @my_user = User.create!(email:"blocbot@bloc.com", password: "password", password_confirmation: "password")
    @my_topic =  Topic.create!(user: @my_user, title: "awesome topic")
    @bookmark = Bookmark.create!(user: @my_user, topic: @my_topic)
  end

  it "returns `nil` if the user has not liked the bookmark" do
    expect(@my_user.liked(@bookmark)).to be_nil
  end

  it "returns the appropriate like if it exists" do
    like = @my_user.likes.where(bookmark: @bookmark).create
    expect(@my_user.liked(@bookmark)).to eq(like)
  end
end

end
