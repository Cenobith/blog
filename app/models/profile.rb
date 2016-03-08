class Profile < ActiveRecord::Base
  belongs_to :user

  validates :nickname, presence: true, length: {maximum: 50}
  validates :firstname, length: {maximum: 50}
  validates :lastname, length: {maximum: 50}
  validates :country, length: {maximum: 50}
  validates :user_id, presence: true

  has_attached_file :userpic, styles: { medium: "600x600>", normal: "100x100>", small: "20x20>" }
  validates_attachment :userpic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end