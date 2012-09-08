class AddMachineNameAndUserNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :machine_name, :string
    add_column :users, :user_name, :string
  end
end
