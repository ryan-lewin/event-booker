class AddEventUserColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :event_users, :approved, :boolean, default: false
  end
end
