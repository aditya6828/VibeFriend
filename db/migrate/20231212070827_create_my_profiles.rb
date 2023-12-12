class CreateMyProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :my_profiles do |t|
      t.string :fname
      t.string :user_name
      t.string :age
      t.datetime :birthdate
      t.string :gender
      t.string :bio
      t.string :mobile
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
