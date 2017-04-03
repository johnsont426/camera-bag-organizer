class RenameBrandInCameras < ActiveRecord::Migration[5.0]
  def change
  	rename_column :cameras, :brand, :name
  end
end
