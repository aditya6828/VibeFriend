class AddReferenceToMyProfile < ActiveRecord::Migration[7.1]
  def change
    add_reference :my_profiles, :user, null: false, foreign_key: true
  end
end
