class CreateBabies < ActiveRecord::Migration[5.2]
  def change
    create_table :babies do |t|
      t.string  :name
      t.string  :sex
      t.date    :dob
      t.string  :picture
      t.text    :allergies
      t.string  :emergency_contact
      t.integer :care_giver_id
      t.integer :mom_id

      t.timestamps
    end
  end
end
