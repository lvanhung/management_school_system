class CreateSchoolClasses < ActiveRecord::Migration
  def change
    create_table :school_classes do |t|
      t.string :name
      t.integer :year
      t.integer :teacher_id
      t.integer :school_id

      t.timestamps null: false
    end
  end
end
