class Curator
  attr_reader :photographs
  def initialize
    @photographs = []
  end

  def add_photograph(photgraph)
    @photographs.push photgraph
  end
end
