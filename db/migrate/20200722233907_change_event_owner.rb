class ChangeEventOwner < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :events, :owner_id
    add_foreign_key :events, :user_id
  end
end
