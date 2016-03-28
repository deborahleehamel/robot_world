require_relative '../test_helper'

class UserCanEditRobotTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_robot_attribute_gets_updated
    create_robots(1)

    this_robot = robot_world.all.last.id

    visit "/robots/#{this_robot}/edit"

    fill_in 'robot[city]', with: "Knoxville"

    click_button "Edit Robot"

    assert_equal "/robots/#{this_robot}", current_path

    assert page.has_content? "Knoxville"
  end
end
