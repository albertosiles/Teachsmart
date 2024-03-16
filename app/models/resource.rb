class Resource < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookmarks

  validates :title, presence: true
  validates :description, presence: true
  validates :subject, presence: true
  validates :student_age, presence: true
  validates :category, presence: true
  validates :resource_type, presence: true

  scope :with_subject, -> (subject) { where(subject: subject) if subject.present? }
  scope :with_student_age, -> (age) { where(student_age: age) if age.present? }

end
