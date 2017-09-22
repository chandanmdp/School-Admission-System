class AddGradeToCandidate < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :grade, :string, default: ""
  end
end
