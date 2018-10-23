class Badge < ApplicationRecord
  has_many :badge_issueds
  has_many :users, through: :badge_issueds

  validates :name, presence: true, uniqueness: true
  validates :img, presence: true, uniqueness: true
end
