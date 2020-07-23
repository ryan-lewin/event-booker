class SwitchEventFk < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :user, foreign_key: true
    remove_reference :events, :owner, foreign_key: true
  end
end
