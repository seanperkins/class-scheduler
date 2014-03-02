class CreateTeacherMemberships < ActiveRecord::Migration
  def change
    create_table :teacher_memberships do |t|
      t.integer :teacher_id
      t.integer :block_id

      t.timestamps
    end

    add_index       :teacher_memberships, :teacher_id
    add_index       :teacher_memberships, :block_id
  end
end
