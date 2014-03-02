class RemoveDayEndtimeImmutableAddDescriptionToBlock < ActiveRecord::Migration
  def change
    remove_column :blocks, :day
    remove_column :blocks, :end_time
    remove_column :blocks, :immutable

    add_column    :blocks, :description, :text
  end
end
