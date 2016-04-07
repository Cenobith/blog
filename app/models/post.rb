class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  self.per_page = 10
  validates :title, presence: true, length: {maximum: 250}
  validates :user_id, presence: true

  has_attached_file :title_image, styles: { medium: "600x600>", thumb: "100x100>", large: "1000x1000>" }
  validates_attachment :title_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  acts_as_taggable

end
