class ChangeScoreForTeachers < ActiveRecord::Migration
  def change
  	add_column :teachers, :score_sum, :float
  end
end
