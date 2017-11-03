class CreateFees < ActiveRecord::Migration[5.1]
  def change
    create_table :fees do |t|
      t.string :fee_name
      t.integer :fee_amount
      t.references :section, foreign_key: true

      t.timestamps
    end
  end
end
