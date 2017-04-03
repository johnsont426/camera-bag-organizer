class RemmoveTypeInLenses < ActiveRecord::Migration[5.0]
  def change
  	remove_column :lenses, :type
  end
end
