class CreateCameras < ActiveRecord::Migration[5.0]
  def change
  	create_table :cameras do |c|
  		c.string :brand
  		c.integer :weight
  	end
  end
end
