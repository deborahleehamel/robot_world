require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_robot_assigns_attributes_correctly
    robot = Robot.new({"name" => "Ioanna",
      "city" => "WheatRidge",
      "state" => "Colorado",
      "avatar" => "7788",
      "birthdate" => "1982-05-28",
      "date hired" => "2014-06-08",
      "department" => "Generosity Engineering"})

    assert_equal "Ioanna", robot.name
    assert_equal "WheatRidge", robot.city
    assert_equal "Colorado", robot.state
    assert_equal "7788", robot.avatar
    assert_equal "1982-05-28", robot.birthdate
    assert_equal "2014-06-08", robot.date_hired
    assert_equal "Generosity Engineering", robot.department
  end


end
