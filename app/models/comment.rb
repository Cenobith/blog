class Comment < ActiveRecord::Base
  belongs_to :post

  validates :nickname, presence: true, length: {maximum: 100}
  validates :content, presence: true
  validates :post_id, presence: true
end
