class RemoveImagesFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :images, :json
  end
end
