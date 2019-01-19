class CreateTrackings < ActiveRecord::Migration
  def change
    create_table :trackings do |t|
      t.string :child_name
      t.integer :class_id
      t.datetime :time_check_in
      t.datetime :time_check_out

      t.timestamps null: false
    end
  end
end
