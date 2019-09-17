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
        # binding.pry
      end
    end
    photograph_by_id
  end
end
