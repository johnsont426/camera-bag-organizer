class Bag < ActiveRecord::Base
	has_many :cameras
	has_many :lenses
	belongs_to :user
end