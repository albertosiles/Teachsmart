class Bookmark < ApplicationRecord
  belongs_to :resource
  belongs_to :user

  validates :user_id, presence: true
  validates :resource_id, presence: true
  validates :user_id, uniqueness: { scope: :resource_id, message: "already bookmarked this resource" }
end
