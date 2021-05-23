class Hashtag < ApplicationRecord
  validates :hashname, presence: true, length: { maximum: 50 }
  has_many :hashtag_post, dependent: :destroy
  has_many :post, through: :hashtag_post
end
