class User < ActiveRecord::Base
  has_one :profile
  has_many :posts
  has_many :media_files

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable #, :registerable

end