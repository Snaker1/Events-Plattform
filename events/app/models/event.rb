class Event < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	validates :address, presence: true
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
	has_many :rsvps
	has_many :users, through: :rsvps
end
