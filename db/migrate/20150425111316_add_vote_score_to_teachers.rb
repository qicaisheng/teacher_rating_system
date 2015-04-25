class AddVoteScoreToTeachers < ActiveRecord::Migration
  def change
  	add_column :teachers, :vote_num, :integer, default: 0
  	add_column :teachers, :average_score, :float, default: 0
  end
end
