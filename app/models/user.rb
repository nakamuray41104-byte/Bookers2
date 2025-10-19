class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 関連付け
  has_many :books, dependent: :destroy
  has_one_attached :profile_image

  # バリデーション
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  
  # プロフィール画像取得メソッド
  def get_profile_image(width, height)
    if profile_image.attached?
      begin
        profile_image.variant(resize_to_limit: [width, height]).processed
      rescue => e
        Rails.logger.error "Image processing failed: #{e.message}"
        nil
      end
    else
      nil
    end
  end
end