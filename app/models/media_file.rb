class MediaFile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :attachment,
                    styles: lambda { |a| a.instance.is_image? ? {small: "x200>", medium: "x300>", large: "x400>"}  : {thumb: { geometry: "100x100#", format: 'jpg', time: 10}, medium: { geometry: "300x300#", format: 'jpg', time: 10}}},
                    processors: lambda { |a| a.is_video? ? [ :ffmpeg ] : [ :thumbnail ] }

  validates_attachment :attachment, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "video/mp4", "video/quicktime", "video/x-msvideo", "video/x-ms-wmv"] }

  def is_image?
    return false unless attachment_content_type
    ["image/jpg", "image/jpeg", "image/png", "image/gif"].include?(attachment_content_type)
  end

  def is_video?
    return false unless attachment_content_type
    ["video/mp4", "video/quicktime", "video/x-msvideo", "video/x-ms-wmv"].include?(attachment_content_type)
  end
end
