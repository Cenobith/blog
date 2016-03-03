class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, presence: true, length: {maximum: 250}
  validates :user_id, presence: true

  has_attached_file :title_image,
                    url: "/assets/posts/:id/:style/:basename.:extension",
                    path: ":rails_root/public/assets/posts/:id/:style/:basename.:extension"
  validates_attachment :title_image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


end
