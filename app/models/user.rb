class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :wannago_lists, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :browsing_histories, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  
  attachment :image, destroy: false
  
end
