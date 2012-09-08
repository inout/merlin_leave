class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :user_id
      t.datetime :time_in
      t.datetime :time_out

      t.timestamps
    end
  end
end
