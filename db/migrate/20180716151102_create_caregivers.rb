class CreateCaregivers < ActiveRecord::Migration[5.2]
  def change
    create_table :caregivers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :age
      t.integer :experience
      t.string :picture
      t.string :phone_number
      t.text :address

      t.timestamps
    end
  end
end
