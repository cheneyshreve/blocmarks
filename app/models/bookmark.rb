class Bookmark < ApplicationRecord
  belongs_to :topic, optional: :true
  belongs_to :user, optional: :true
  has_many :likes, dependent: :destroy
end
