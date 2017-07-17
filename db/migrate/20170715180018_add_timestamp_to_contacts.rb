class AddTimestampToContacts < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :contacts, :null => false
  end
end
