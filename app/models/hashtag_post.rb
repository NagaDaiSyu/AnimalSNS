class HashtagPost < ApplicationRecord
  belongs_to :post
  belongs_to :hashtag
  validates :post__id, presence: true
  validates :hashtag_id, presence: true
end
