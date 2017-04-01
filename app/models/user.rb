class User < ActiveRecord::Base
	has_many :bags
	has_many :cameras, through: :bags
	has_many :lenses, through: :cameras
end