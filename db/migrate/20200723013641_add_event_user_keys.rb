class AddEventUserKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :event_users, :user, foreign_key: true
    add_reference :event_users, :event, foreign_key: true
  end
end
