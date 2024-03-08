class Resource < ApplicationRecord
  has_many :reviews
  has_many :bookmarks

  validates :title, presence: true
  validates :description, presence: true
  validates :subject, presence: true
  validates :student_age, presence: true
  validates :category, presence: true
  validates :resource_type, presence: true
end
