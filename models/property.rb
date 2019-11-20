require('pg')

class Property

  attr_accessor :address, :value, :number_of_bedrooms, :year_built, :let_status,
                :square_footage, :build

  attr_reader :id

  def initialize(info)
    @id = info['id'] if info['id']
    @address = info['address']
    @value = info['value'].to_i()
    @number_of_bedrooms = info['number_of_bedrooms'].to_i()
    @year_built = info['year_built'].to_i()
    @let_status = info['let_status']
    @square_footage = info['square_footage'].to_i()
    @build = info['build']
  end

  def save()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "INSERT INTO properties
    (address, value, number_of_bedrooms, year_built, let_status, square_footage, build)
    VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;"
    values = [@address, @value, @number_of_bedrooms, @year_built, @let_status, @square_footage, @build]
    db.prepare('save', sql)
    result = db.exec_prepared('save', values)
    @id = result[0]['id'].to_i()
    db.close
  end

  def Property.delete_all()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "DELETE FROM properties;"
    db.prepare('delete_all', sql)
    db.exec_prepared('delete_all', [])
    db.close
  end

  def Property.all()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "SELECT * FROM properties;"
    db.prepare('all', sql)
    properties = db.exec_prepared("all", [])
    db.close
    return properties.map{ |property| Property.new(properties) }
  end

  def delete()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "DELETE FROM properties WHERE id = $1;"
    values = [@id]
    db.prepare('delete', sql)
    db.exec_prepared('delete', values)
    db.close()
  end

  def update()
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "UPDATE properties SET (address, value, number_of_bedrooms, year_built,
          let_status, square_footage, build) = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8;"
    values = [@address, @value, @number_of_bedrooms, @year_built, @let_status, @square_footage, @build, @id]
    db.prepare('update', sql)
    db.exec_prepared('update', values)
    db.close
  end

  def Property.find(id)
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "SELECT * FROM properties WHERE id = $1;"
    values = [id]
    db.prepare('find', sql)
    # Return property information (array of hashes)
    found_property = db.exec_prepared('find', values)
    db.close
    # Extract hash from the array
    property_hash = found_property[0]
    # Return new property using hash
    return Property.new(property_hash)
  end

  def Property.find_by_address(address)
    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "SELECT * FROM properties WHERE address = $1;"
    values = [address]
    db.prepare('find_by_address', sql)
    found_property = db.exec_prepared('find_by_address', values)
    db.close
    return Property.new(found_property[0])
  end

end
