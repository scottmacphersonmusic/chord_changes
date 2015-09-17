class Chord < ActiveRecord::Base
  belongs_to :song
  validates :pitch, :measure, :sequence, presence: true
  validates :measure, :sequence, numericality: { only_integer: true }
end
