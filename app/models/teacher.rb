class Teacher < ActiveRecord::Base
  has_many :votes
  mount_uploader :picture, PictureUploader
  validates :teacher_id, presence: true,  uniqueness: true
  validates :name, presence: true
  validate :picture_presence
  validate :picture_size

	def remove_picture(teacher)
		teacher.remove_picture!
		teacher.save
	end

  private
  	def picture_presence
  	  errors.add(:picture,"should add picture") unless picture.present? or remote_picture_url.present?
  	end

    # Validates the size of an uploaded picture.
    def picture_size
      errors.add(:picture, "should be less than 5MB") if picture.size > 5.megabytes
    end

end
