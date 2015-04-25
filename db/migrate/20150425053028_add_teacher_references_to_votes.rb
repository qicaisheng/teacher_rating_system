class AddTeacherReferencesToVotes < ActiveRecord::Migration
  def change
  	add_reference :votes, :teacher, index: true
  end
end
