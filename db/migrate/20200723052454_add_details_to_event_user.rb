class AddDetailsToEventUser < ActiveRecord::Migration[5.2]
  def change
    add_column :event_users, :event_title, :string
    add_column :event_users, :user_name, :string
  end
end
