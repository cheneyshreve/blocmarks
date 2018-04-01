require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:my_user) { User.create!(email:"bloc@bloc.com", password: "password", password_confirmation: "password") }
  let(:my_topic) { Topic.create!(user: my_user, title: "my topic") }
  let(:my_bookmark) {Bookmark.create!(topic: my_topic, url: "myawesometopic.com") }

  it { is_expected.to belong_to(:topic) }


  describe "attributes" do
    it "responds to url" do
     expect(my_bookmark).to have_attributes(url: "myawesometopic.com")
    end
  end

end
