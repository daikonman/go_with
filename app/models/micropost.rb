class Micropost < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  def self.search(search)
    if search
      where(['content LIKE ?', "%#{search}%"])
    else
      all # 全て表示。
    end
  end
end

