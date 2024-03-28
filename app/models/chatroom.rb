class Chatroom < ApplicationRecord
  has_many :messages, dependant: :destroy
  belongs_to :user
end
