class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.string :phone
      t.date :birth_date
      t.date :joining_date
      t.boolean :is_active

      t.timestamps
    end
  end
end
