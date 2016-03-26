require_relative '../test_helper'

class UserCanDeleteRobotTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_robot_is_deleted
    create_robots(1)

    visit '/robots'

    assert page.has_content? ("Robot 1")

    within ("h2") do
      click_link("Robot 1")
    end

    click_button("Delete this Robot Forever!")

    assert_equal "/robots", current_path

    refute page.has_content? ("Robot 1")
  end
end
