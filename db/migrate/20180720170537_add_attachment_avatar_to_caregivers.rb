class AddAttachmentAvatarToCaregivers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :caregivers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :caregivers, :avatar
  end
end
