class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.string :section_name
      t.text :section_grades

      t.timestamps
    end
  end
end
