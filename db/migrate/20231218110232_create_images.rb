# db/migrate/[timestamp]_create_images.rb
class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images do |t|
      t.string :image_data  # Change json to string
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
