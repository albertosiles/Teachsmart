class Resource < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookmarks
  has_many_attached :photos
  has_many_attached :files

  validates :title, presence: true
  validates :description, presence: true
  validates :subject, presence: true
  validates :student_age, presence: true
  validates :category, presence: true
  validates :resource_type, presence: true
end
