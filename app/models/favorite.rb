class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  default_scope -> { order(created_at: :desc) }
  validates_uniqueness_of :micropost_id, scope: :user_id
end
