class Orders < ActiveRecord::Migration
  def change
  	create_table :orders do |t|
		t.string :phone
		t.string :name
		t.string :adress
		t.text :pizza
		
  		t.timestamps
  	end
  end
end
