class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :student_id
      t.date :payment_date
      t.boolean :payment_status, default: false, null: false

      t.timestamps null: false
    end
    add_foreign_key :payments, :students
  end
end
