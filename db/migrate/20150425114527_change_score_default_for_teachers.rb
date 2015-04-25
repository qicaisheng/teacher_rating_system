class ChangeScoreDefaultForTeachers < ActiveRecord::Migration
  def change
  	change_column_default(:teachers, :score_sum, 0)
  end
end
