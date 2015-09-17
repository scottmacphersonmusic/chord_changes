class Song < ActiveRecord::Base
  has_many :chords
  validates :title, :composer, presence: true
end
