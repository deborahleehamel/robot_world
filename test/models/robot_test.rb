require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_robot_assigns_attributes_correctly

    data = {:id         => 1,
            :name       => "Maureen",
            :city       => "WheatRidge",
            :state      => "Colorado",
            :avatar     => "7788",
            :birthdate  => "06-28-1999",
            :date_hired => "06-08-2014",
            :department => "Generosity Engineering"}

    robot = Robot.new(data)

    assert_equal 1, robot.id
    assert_equal "Maureen", robot.name
    assert_equal "WheatRidge", robot.city
    assert_equal "Colorado", robot.state
    assert_equal "7788", robot.avatar
    assert_equal "06-28-1999", robot.birthdate
    assert_equal "06-08-2014", robot.date_hired
    assert_equal "Generosity Engineering", robot.department
  end
end
