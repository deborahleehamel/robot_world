require_relative '../test_helper'

class UserCanDeleteRobotTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_robot_is_deleted
    visit '/'

    click_link_or_button("Make a New Robot")

    assert_equal "/robots/new", current_path
    fill_in 'robot[name]', with: "Betty Boop"
    fill_in 'robot[avatar]', with: "765"
    fill_in 'robot[birthdate]', with: "09-08-2001"

    click_button("make_robot")

    assert_equal "/robots", current_path

    within("#robots") do
      assert page.has_content? ("Betty Boop")
    end

    click_button("Delete")

    assert_equal "/robots", current_path

    refute page.has_content? ("Betty Boop")
  end
end
