class AddLengthtoTasks < ActiveRecord::Migration
  def change
  	change_table :tasks do |t|
  		t.integer :length
  	end 
  end
end
