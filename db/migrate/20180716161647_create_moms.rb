class CreateMoms < ActiveRecord::Migration[5.2]
  def change
    create_table :moms do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :picture
      t.string :phone_number
      t.text   :pick_up_authorization

      t.timestamps
    end
  end
end
