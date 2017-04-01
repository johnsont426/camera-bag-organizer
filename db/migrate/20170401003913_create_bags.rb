class CreateBags < ActiveRecord::Migration[5.0]
  def change
  	create_table :bags do |b|
  		b.string :type
  	end
  end
end
