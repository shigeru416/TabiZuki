class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# --------------------------------------
# Relations
# --------------------------------------
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :wannago_lists, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :browsing_histories, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

# --------------------------------------
# Validations
# --------------------------------------
  validates :name, presence: true, length: {maximum: 20}
  validates :introduction, length: {maximum: 50}

  attachment :image, destroy: false

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end
end
