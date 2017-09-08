class RemoveSectionGradesFromSections < ActiveRecord::Migration[5.1]
  def change
    remove_column :sections, :section_grades, :string
  end
end
