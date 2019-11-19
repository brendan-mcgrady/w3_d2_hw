require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/property')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class PropertyTest < MiniTest::Test

  def test_can_create_new_propery
    property2 = {
      'address' => '89 Progress Dr, Caldercruix',
      'value' => 75000,
      'number_of_bedrooms' => 3,
      'year_built' => 1940,
      'let_status' => true,
      'square_footage' => 50,
      'build' => 'council'
    }

    new_property = Property.new(property2)
    assert_equal('89 Progress Dr, Caldercruix', new_property.address())
  end

end
