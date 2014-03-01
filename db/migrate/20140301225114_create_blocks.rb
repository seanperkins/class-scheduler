class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.integer :schedule_id
      t.integer :duration
      t.string :day
      t.integer :start_time
      t.integer :end_time
      t.boolean :immutable

      t.timestamps
    end
  end
end