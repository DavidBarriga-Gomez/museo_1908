require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/artist'
require './lib/photograph'
require './lib/curator'

class CuratorTest < Minitest::Test
  def setup
    @curator = Curator.new
    @photo_1 = Photograph.new(
      {
        id: "1",
        name: "Rue Mouffetard, Paris (Boy with Bottles)",
        artist_id: "1",
        year: "1954"
     })
    @photo_2 = Photograph.new(
       {
         id: "2",
         name: "Moonrise, Hernandez",
         artist_id: "2",
         year: "1941"
      })
    @photo_3 = Photograph.new(
      {
        id: "3",
        name: "Identical Twins, Roselle, New Jersey",
        artist_id: "3",
        year: "1967"
      })
    @photo_4 = Photograph.new(
      {
        id: "4",
        name: "Monolith, The Face of Half Dome",
        artist_id: "3",
        year: "1927"
      })
      @photo_5 = Photograph.new(
        {
          id: "4",
          name: "Child with Toy Hand Grenade in Central Park",
          artist_id: "3",
          year: "1962"
        })

    @artist_1 = Artist.new(
      {
        id: "1",
        name: "Henri Cartier-Bresson",
        born: "1908",
        died: "2004",
        country: "France"
      })
    @artist_2 = Artist.new(
      {
        id: "2",
        name: "Ansel Adams",
        born: "1902",
        died: "1984",
        country: "United States"
      })
    @artist_3 = Artist.new(
      {
        id: "3",
        name: "Diane Arbus",
        born: "1923",
        died: "1971",
        country: "United States"
      })
  end

  def test_existence
    assert_instance_of Curator, @curator
  end

  def test_initialized
    assert_equal [], @curator.photographs
    assert_equal [], @curator.artists
  end

  def test_method_add_photographs
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    assert_equal [@photo_1, @photo_2], @curator.photographs
  end

  def test_method_add_artist
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    assert_equal [@artist_1, @artist_2], @curator.artists
  end

  def test_method_find_artist_by_id
    @curator.add_artist(@artist_1)
    @curator.add_artist(@artist_2)
    assert_equal @artist_1, @curator.find_artist_by_id("1")
  end

  def test_method_find_photgraph_by_id
    @curator.add_photograph(@photo_1)
    @curator.add_photograph(@photo_2)
    assert_equal @photo_2, @curator.find_photograph_by_id("2")
  end

    def test_method_find_photographs_by_artist
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)
      @curator.add_artist(@artist_3)
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      @curator.add_photograph(@photo_3)
      @curator.add_photograph(@photo_4)
      assert_equal [@photo_3, @photo_4], @curator.find_photographs_by_artist(@artist_3)
    end

    def test_method_artists_with_multiple_photographs
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)
      @curator.add_artist(@artist_3)
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      @curator.add_photograph(@photo_3)
      @curator.add_photograph(@photo_4)
      assert_equal [@artist_3], @curator.artists_with_multiple_photographs
    end

    def test_method_photographs_taken_by_artist_from
      @curator.add_artist(@artist_1)
      @curator.add_artist(@artist_2)
      @curator.add_artist(@artist_3)
      @curator.add_photograph(@photo_1)
      @curator.add_photograph(@photo_2)
      @curator.add_photograph(@photo_3)
      @curator.add_photograph(@photo_4)
      assert_equal [@photo_2, @photo_3, @photo_4], @curator.photographs_taken_by_artist_from("United States")
    end

    def test_method_load_photographs
      # @curator.load_photographs('./data/photographs.csv')
      assert_equal [@photo_1, @photo_2, @photo_3, @photo_4], @curator.load_photographs('./data/photographs.csv')
    end
end
