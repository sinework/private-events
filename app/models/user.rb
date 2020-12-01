class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
  has_secure_password
  has_many :events
  has_many :attendances
  has_many :attended_events, class_name: 'Event', through: :attendances, foreign_key: :event_id
end
