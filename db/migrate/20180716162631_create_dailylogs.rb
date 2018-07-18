class CreateDailylogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dailylogs do |t|
      t.datetime  :time_in
      t.integer  :nap
      t.integer  :meal
      t.integer  :diaper
      t.integer  :play_time
      t.text  :summary
      t.boolean  :meds, :default => false
      t.datetime  :time_out
      t.integer :baby_id
      t.integer :caregiver_id

      t.timestamps
    end
  end
end
