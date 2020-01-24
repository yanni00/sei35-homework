class Song < ApplicationRecord
  belongs_to :album, optional: true #Let us create a song without specifying album
  belongs_to :artist, optional: true # ...or the artist

  # This is one side of many-to-many association;
  # it tells AciveRecord to use the 'genres_songs'
  # table to find the genres for this song.
  has_and_belongs_to_many :genres

  has_and_belongs_to_many :mixtapes

end
