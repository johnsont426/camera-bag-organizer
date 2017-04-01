class AddBagIdToCameras < ActiveRecord::Migration[5.0]
  def change
  	add_column :cameras, :bag_id, :integer
  end
end
