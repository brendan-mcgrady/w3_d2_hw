require('pg')

class Property

  attr_accessor :address, :value, :number_of_bedrooms, :year_built, :let_status,
                :square_footage, :build

  attr_reader :id

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @address = info['address']
    @value = info['value'].to_i()
    @number_of_bedrooms = info['number_of_bedrooms'].to_i()
    @year_built = info['year_built'].to_i()
    @let_status = info['let_status']
    @square_footage = info['square_footage'].to_i()
    @build = info['build']
  end

end
