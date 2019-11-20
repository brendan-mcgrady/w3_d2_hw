require('pry')
require_relative('models/property')

  property1 = Property.new({
  'address' => '91 Progress Dr, Caldercruix',
  'value' => 60000,
  'number_of_bedrooms' => 2,
  'year_built' => 1940,
  'let_status' => false,
  'square_footage' => 50,
  'build' => 'council'
  })

  property2 = Property.new({
    'address' => '89 Progress Dr, Caldercruix',
    'value' => 75000,
    'number_of_bedrooms' => 3,
    'year_built' => 1940,
    'let_status' => true,
    'square_footage' => 50,
    'build' => 'council'
  })

  property1.save()
  property2.save()
  
  binding.pry
  nil
