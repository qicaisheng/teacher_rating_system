class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable,
         :rememberable,
         :trackable,
         :validatable,
         :authentication_keys => [:username]

  validates :username, presence: true, length: {maximum: 255}

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
