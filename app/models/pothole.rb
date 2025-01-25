class Pothole < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
end

class Pothole < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
end
