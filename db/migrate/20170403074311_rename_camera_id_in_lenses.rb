class RenameCameraIdInLenses < ActiveRecord::Migration[5.0]
  def change
  	rename_column :lenses, :camera_id, :bag_id
  end
end
