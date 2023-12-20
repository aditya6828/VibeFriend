class CreateGroupChats < ActiveRecord::Migration[7.1]
  def change
    create_table :group_chats do |t|
      t.string :name

      t.timestamps
    end
  end
end
