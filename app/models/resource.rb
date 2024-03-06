class Resource < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookmarks

  validates :title, presence: true
  validates :description, presence: true
  validates :subject, presence: true
  validates :grade, presence: true
  validates :category, presence: true
  validates :resource_type, presence: true
end
