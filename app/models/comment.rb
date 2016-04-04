class Comment < ActiveRecord::Base
  belongs_to :post

  validates :nickname, presence: true, length: {maximum: 100}
  validates :email, presence: true, length: {maximum: 100}
  validates :content, presence: true
  validates :post_id, presence: true
  validates_format_of :email, with:  /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i
end
