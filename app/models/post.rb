class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: {maximum: 250}
  validates :user_id, presence: true

end
