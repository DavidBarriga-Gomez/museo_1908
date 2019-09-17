require 'minitest/autorun'
require 'minitest/pride'
require './lib/artist'
require './lib/photograph'
require './lib/fileio'

class FileIOTest < Minitest::Test
  def setup
    @locations = {
      artists: './data/artists.csv',
      photographs: './data/photographs.csv',
    }
  end


end
