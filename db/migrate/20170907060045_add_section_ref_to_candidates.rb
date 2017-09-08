class AddSectionRefToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_reference :candidates, :section, foreign_key: true
  end
end
