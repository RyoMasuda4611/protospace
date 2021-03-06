class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :email, :username
  validates :password, presence: true, length: {minimum: 6}
  mount_uploader :avatar, AvatarUploader
  has_many :prototypes
  has_many :likes
  has_many :comments
end
