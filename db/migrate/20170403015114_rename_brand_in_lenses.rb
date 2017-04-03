class RenameBrandInLenses < ActiveRecord::Migration[5.0]
  def change
  	rename_column :lenses, :brand, :name
  end
end
