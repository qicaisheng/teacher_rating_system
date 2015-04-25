class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :teacher_id
      t.string :picture
      t.string :name

      t.timestamps null: false
    end
  end
end
