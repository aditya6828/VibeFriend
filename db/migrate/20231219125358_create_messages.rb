class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|

      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :friend_request, null: false, foreign_key: true
      t.references :group_chat, null: false, foreign_key: true
      t.timestamps
    end
  end
end
