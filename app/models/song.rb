class Song < ActiveRecord::Base
  validates :title, :composer, presence: true
end
