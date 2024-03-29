class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :bookmarks
  has_many :resources
  has_many :messages
  # has_many :resources, through: :bookmarks
  has_many :forum_threads
  has_many :forum_posts
  has_many :reviews
  has_one :chatroom
end
