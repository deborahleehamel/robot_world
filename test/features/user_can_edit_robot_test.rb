require_relative '../test_helper'

class UserCanEditRobotTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_robot_attribute_gets_updated

    create_robots(1)

    visit "/robots/#{name}/edit", current_path

    fill_in 'robot[city]', with: "Knoxville"

    click_button "Edit Robot"

    assert_equal "/robots#{name}", current_path

    assert page.has_content? "Knoxville"
  end

end
