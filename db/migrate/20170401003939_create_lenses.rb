class CreateLenses < ActiveRecord::Migration[5.0]
  def change
  	create_table :lenses do |l|
  		l.string :brand
  		l.string :type
  		l.integer :weight
  	end
  end
end
