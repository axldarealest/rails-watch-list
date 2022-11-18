class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :bookmarks
  has_one_attached :photo
  has_many :movies, through: :bookmarks, dependent: :destroy
end
