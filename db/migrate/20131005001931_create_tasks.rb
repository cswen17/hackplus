class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.boolean :completed
      t.datetime :duetime
      t.belongs_to :user
      t.timestamps
    end
  end
end
