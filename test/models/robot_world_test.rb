require_relative '../test_helper'

class RobotWorldTest < Minitest::Test
  include TestHelpers

  def test_it_can_create_a_robot
    create_robots(1)

    robot = robot_world.all.last

    assert_equal  "Robot 1", robot.name
    assert_equal  "Denver 1", robot.city
    assert_equal  "Colorado 1", robot.state
    assert_equal  "4441", robot.avatar
    assert_equal  "2011-06-27", robot.birthdate
    assert_equal  "2001-03-10", robot.date_hired
    assert_equal  "Kindness Investigations 1", robot.department
  end

  def test_it_finds_all_robots
    create_robots(3)

    assert_equal 3, robot_world.all.count

    robot_world.all.each_with_index do |robot, index|
      assert_equal Robot, robot.class
      assert_equal "Robot #{index + 1}", robot.name
    end
  end

  def test_it_finds_a_specific_robot
    create_robots(3)

    names = robot_world.all.map { |robot| robot.name }
    names.each_with_index do |name, index|
      robot = robot_world.find(name)
      assert_equal "Robot #{index + 1}", robot.name
      assert_equal "Denver #{index + 1}", robot.city
    end
  end

  def test_it_updates_robot
    skip
    create_robots(2)
    updated_data = {
      :nane => "updated name",
      :city => "updated city"
    }

    robot = robot_world.all.last.name

    robot_world.update(updated_data, robot)

    new_robot = robot_world.find(robot)

    assert_equal updated_data[:name], new_robot.name
    assert_equal updated_data[:city], new_robot.city
  end

  def test_it_deletes_a_robot
    create_robots(3)

    robot = robot_world.all.last.name

    initial_count = robot_world.all.count

    robot_world.delete(robot)

    final_count = robot_world.all.count

    assert_equal 1, (initial_count - final_count)
  end


end
