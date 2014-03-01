class CreateStudentGroupMemberships < ActiveRecord::Migration
  def change
    create_table :student_group_memberships do |t|
      t.integer :student_group_id
      t.integer :block_id

      t.timestamps
    end
    
    add_index       :student_group_memberships, :student_group_id
    add_index       :student_group_memberships, :block_id
  end
end
