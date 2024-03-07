class Review < ApplicationRecord
  belongs_to :resource
  belongs_to :user

  validates :rating, presence: true
end
