class CreateEligibilities < ActiveRecord::Migration[5.1]
  def change
    create_table :eligibilities do |t|
      t.string :title
      t.text :criteria

      t.timestamps
    end
  end
end
