class AddfileToimages < ActiveRecord::Migration[7.1]
  def change
    add_column :images, :file, :string
  end
end
