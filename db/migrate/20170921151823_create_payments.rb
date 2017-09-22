class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :payment_name
      t.attachment :payment_image
      t.string :payment_status, default: ""
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
