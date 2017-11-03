class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :payment_mode
      t.attachment :payment_image
      t.string :payment_status, default: ""
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
