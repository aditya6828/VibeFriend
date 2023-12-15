class CreatePost < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.integer :like , default: 0
      t.string :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
