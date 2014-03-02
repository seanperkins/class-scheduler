class CreateStudentGroups < ActiveRecord::Migration
  def change
    create_table :student_groups do |t|
      t.string  :description
      t.string  :grade
      t.timestamps
    end
  end
end
