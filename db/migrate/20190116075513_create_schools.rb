class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :parent_id
      t.string :payment_type
      t.integer :owner_id
      t.integer :hq_owner_id

      t.timestamps null: false
    end
  end
end
