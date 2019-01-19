class CreateFeatureControls < ActiveRecord::Migration
  def change
    create_table :feature_controls do |t|
      t.string :feature_name
      t.string :type_control
      t.string :value

      t.timestamps null: false
    end
  end
end
