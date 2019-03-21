require_relative('../db/sqlrunner.rb')

class House

attr_reader :name, :id, :crest

def initialize(options)
  @name = options['name']
  @id = options['id'].to_i if options['id']
  @crest = options['crest']
end

def save
  sql = 'INSERT INTO houses(name, crest)
        VALUES ($1, $2)
        RETURNING *'
  values = [@name, @crest]
  house = SqlRunner.run(sql, values)
  @id = house.first['id'].to_i
end

def self.find_all
  sql= 'SELECT * FROM houses'
  house_hash = SqlRunner.run(sql)
  house = house_hash.map { |house| House.new(house) }
  p house
end

def self.find_house_by_id(id)
  sql = 'SELECT * FROM houses
        WHERE id = $1'
  values = [id]
  house = SqlRunner.run(sql, values)
  result = House.new(house.first)
  p result
end

end
