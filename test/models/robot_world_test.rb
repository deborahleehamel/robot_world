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

  def test_it_can_find_all_robots
    create_robots(3)

    assert_equal 3, robot_world.all.count

    robot_world.all.each_with_index do |robot, index|
      assert_equal Robot, robot.class
      assert_equal "Robot #{index + 1}", robot.name
    end
  end

  def test_it_can_find_a_specific_robot
    create_robots(3)

    robot = robot_world.all.last

    ids = robot_world.all.map { |robot| robot.id }
    ids.each do |id|
      robot = robot_world.find(id)
      assert_equal "Robot #{id}", robot.name
      assert_equal "Denver #{id}", robot.city
    end
  end

  def test_it_can_update_robot
    create_robots(2)
    updated_data = {
      name: "updated name",
      city: "updated city"
    }

    robot = robot_world.all.last.id

    robot_world.update(updated_data, robot)

    new_robot = robot_world.find(robot)

    assert_equal "updated name", new_robot.name
    assert_equal "updated city", new_robot.city
  end

  def test_it_deletes_a_robot
    create_robots(3)

    robot = robot_world.all.last.id
    initial_count = robot_world.all.count

    robot_world.destroy(robot)
    final_count = robot_world.all.count

    assert_equal 2, (initial_count - 1)
  end

end
