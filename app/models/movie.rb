class Movie < ApplicationRecord
  has_many :bookmarks
  # before_destroy :check_bookmarks
  validates :title, :overview, uniqueness: true
  validates :title, :overview, presence: true

  private

  def check_bookmarks
    false if bookmarks.exists?
  end
end
