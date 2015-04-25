class AddRemotePictureUrlToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :remote_picture_url, :string
  end
end
