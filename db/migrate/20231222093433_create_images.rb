class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|

      t.bigint :post_id, null: false
      t.string :file
      t.index [:post_id], name: "index_images_on_post_id"

      t.timestamps
    end
  end
end
