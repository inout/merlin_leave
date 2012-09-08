class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.integer :requestor_id
      t.string :leave_type
      t.integer :approver_id
      t.text :leave_notes
      t.datetime :requested_on
      t.datetime :approved_on

      t.timestamps
    end
  end
end
