class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
end
