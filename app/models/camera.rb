class Camera < ActiveRecord::Base
	has_many :lenses
	belongs_to :bag
end