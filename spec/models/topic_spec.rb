require 'rails_helper'


RSpec.describe Topic, type: :model do
  let(:my_user) { User.create!(email:"bloc@bloc.com", password: "password", password_confirmation: "password") }
  let(:my_topic) { Topic.create!(user: my_user, title: "my topic") }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:bookmarks)}

  describe "attributes" do
    it "responds to title" do
     expect(my_topic).to have_attributes(title: "my topic")
    end
  end


end
