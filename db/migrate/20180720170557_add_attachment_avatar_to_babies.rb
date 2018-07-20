class AddAttachmentAvatarToBabies < ActiveRecord::Migration[5.2]
  def self.up
    change_table :babies do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :babies, :avatar
  end
end
