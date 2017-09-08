class AddAttachmentImageToCandidates < ActiveRecord::Migration[5.1]
  def self.up
    change_table :candidates do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :candidates, :image
  end
end
