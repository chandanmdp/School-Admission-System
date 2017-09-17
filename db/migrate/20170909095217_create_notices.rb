class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices do |t|
      t.string :notice_title
      t.text :content

      t.timestamps
    end
  end
end
