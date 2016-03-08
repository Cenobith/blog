class Widget < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "600x600>", thumb: "100x100>", normal: "160x160>" }
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
