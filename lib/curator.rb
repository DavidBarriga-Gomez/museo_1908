require './lib/artist'
require './lib/photograph'
require './lib/fileio'

class Curator
  attr_reader :photographs, :artists
  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photgraph)
    @photographs.push photgraph
  end

  def add_artist(artist)
    @artists.push artist
  end

  def find_artist_by_id(id)
    artist_by_id = nil
    @artists.each do |artist|
      if artist.id == id
        artist_by_id = artist
      end
    end
    artist_by_id
  end

  def find_photograph_by_id(id)
    photograph_by_id = nil
    @photographs.each do |photo|
      if photo.id == id
        photograph_by_id = photo
      end
    end
    photograph_by_id
  end

  def find_photographs_by_artist(artist)
    photograph_collection = []
      @photographs.each do |photo|
        if photo.artist_id == artist.id
          photograph_collection.push photo
        end
      end
      photograph_collection
  end

  def artists_with_multiple_photographs
    artists_multiple = []
    @artists.each do |artist|
      if find_photographs_by_artist(artist).length > 1
        artists_multiple.push artist
      end
    end
    artists_multiple
  end

  def photographs_taken_by_artist_from(country)
    photo_nationality = []
    @photographs.each do |photo|
      if find_artist_by_id(photo.artist_id).country == country
      photo_nationality.push photo
      end
    end
    photo_nationality
  end

  def load_photographs(file)
    FileIO.load_photographs(file).each do |photo|
      @photographs.push Photograph.new(photo)
    # binding.pry
    end
    @photographs
  end
end
