class CreateCareGivers < ActiveRecord::Migration[5.2]
  def change
    create_table :care_givers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.integer :experience
      t.string :picture
      t.string :phone_number
      t.integer :rating
      t.text :address
      t.boolean :availability

      t.timestamps
    end
  end
end
