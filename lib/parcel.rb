class Parcel
  attr_reader :id, :height, :width, :length, :weight

  @@parcels = {}
  @@total_rows = 0
  
  def initialize(height, width, length, weight, id)
    @height = height
    @width = width
    @length = length
    @weight = weight
    @id = id || @@total_rows += 1
  end

  def save
    @@parcels[self.id] = Parcel.new(self.height, self.width, self.length, self.weight, self.id)
  end

  def ==(parcel_to_compare)
    self.id() == parcel_to_compare.id()
  end

  def self.all
    @@parcels.values()
  end

  def self.find(id)
    @@parcels[id]
  end

  def update(height, width, length, weight)
    @height = height
    @width = width
    @length = length
    @weight = weight
  end
end