class AddInteresttoTasks < ActiveRecord::Migration
   def change
    change_table :tasks do |t|
      t.integer :interest
    end
  end
end
