class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :bookmarks
  has_many_attached :photos
  has_many :movies, through: :bookmarks, dependent: :destroy
end
