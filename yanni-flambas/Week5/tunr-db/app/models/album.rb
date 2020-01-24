class Album < ApplicationRecord
  # belongs_to :artist, optional: true
  has_many :songs

  # Through association: an album has artists,
  # but not directly (i.e., there is no artist_id on
  # the 'albums' table), but VIA its Songs
  # (because each song DOES have an artist_id)
  has_many :artists, through: 'songs'

  #

  def artists
    self.artists.uniq.first
  end
end
