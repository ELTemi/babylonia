class CreateDailylogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dailylogs do |t|
      t.datetime  :time_in
      t.string  :nap
      t.string  :meal
      t.string  :diaper
      t.string  :play
      t.text  :summary
      t.string  :meds
      t.datetime  :time_out
      t.integer :baby_id
      t.integer :caregiver_id

      t.timestamps
    end
  end
end
