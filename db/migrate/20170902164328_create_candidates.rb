class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :father_name
      t.string :mother_name
      t.string :education
      t.text :contact_address
      t.string :parent_contact_number, null: false
      t.string :alternate_parent_contact_number

      t.timestamps
    end
  end
end
