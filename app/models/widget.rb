class Widget < ActiveRecord::Base
  has_attached_file :image,
                    url: "/assets/widgets/:id/:style/:basename.:extension",
                    path: ":rails_root/public/assets/widgets/:id/:style/:basename.:extension"
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
