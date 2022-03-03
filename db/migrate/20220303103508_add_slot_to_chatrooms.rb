class AddSlotToChatrooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :slot, foreign_key: true
  end
end
