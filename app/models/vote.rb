class Vote < ActiveRecord::Base
  belongs_to :teacher
  # validates :ip, presence: true,  uniqueness: true
  validates :score, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10}

end
