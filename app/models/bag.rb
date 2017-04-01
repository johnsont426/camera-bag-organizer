class Bag < ActiveRecord::Base
	has_many :camera
	has_many :lenses, through: :camera
end