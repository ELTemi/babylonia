class AddAttachmentAvatarToMoms < ActiveRecord::Migration[5.2]
  def self.up
    change_table :moms do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :moms, :avatar
  end
end
