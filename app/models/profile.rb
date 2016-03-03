class Profile < ActiveRecord::Base
  belongs_to :user

  validates :nickname, presence: true, length: {maximum: 50}
  validates :firstname, length: {maximum: 50}
  validates :lastname, length: {maximum: 50}
  validates :country, length: {maximum: 50}
  validates :user_id, presence: true

  has_attached_file :userpic,
                    url: "/assets/users/:id/:style/:basename.:extension",
                    path: ":rails_root/public/assets/users/:id/:style/:basename.:extension"
  validates_attachment :userpic, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end