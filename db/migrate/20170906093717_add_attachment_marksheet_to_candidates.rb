class AddAttachmentMarksheetToCandidates < ActiveRecord::Migration[5.0]
  def self.up
    change_table :candidates do |t|
      t.attachment :marksheet
    end
  end

  def self.down
    remove_attachment :candidates, :marksheet
  end
end
