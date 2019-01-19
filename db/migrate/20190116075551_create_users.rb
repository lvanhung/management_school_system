class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :role_id
      t.boolean :is_paid

      t.timestamps null: false
    end
  end
end
