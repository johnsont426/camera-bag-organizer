class AddCameraIdToLenses < ActiveRecord::Migration[5.0]
  def change
  	add_column :lenses, :camera_id, :integer
  end
end
