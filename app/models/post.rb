class Post < ApplicationRecord
  # --------------------------------------
  # Relations
  # --------------------------------------
  belongs_to :user
  belongs_to :category

  has_many :browsing_histories, dependent: :destroy
  has_many :wannago_lists, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_images, dependent: :destroy

  # --------------------------------------
  # Validations
  # --------------------------------------
  validates :title, presence: true, length: { maximum: 20 }
  validates :post_images_images, presence: true
  validates :place, presence: true
  validates :category_id, presence: true
  validates :content, presence: true

  acts_as_taggable_on :tags
  accepts_attachments_for :post_images, attachment: :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    end

  def wannago_listed_by?(user)
    wannago_lists.where(user_id: user.id).exists?
   end
end
