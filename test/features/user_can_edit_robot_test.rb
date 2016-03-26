require_relative '../test_helper'

class UserCanEditRobotTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def test_robot_attribute_gets_updated

    create_robots(1)

    visit "/robots/#{robot_world.all.last.id}/edit", current_path

    fill_in 'robot[city]', with: "Knoxville"

    click_button "Edit Robot"

    assert_equal "/robots/#{id}", current_path

    assert page.has_content? "Knoxville"
  end

  # def test_user_can_create_new_robot
  #     visit '/'
  #
  #     click_link("Make a New Robot")
  #     assert_equal "/robots/new", current_path
  #
  #     fill_in 'robot[name]', with: "George Carlin"
  #     fill_in 'robot[avatar]', with: "999"
  #     fill_in 'robot[birthdate]', with: "09-09-2002"
  #
  #     click_button("Make this Robot")
  #     assert_equal "/robots", current_path
  #
  #     within("#robots") do
  #       assert page.has_content?("George Carlin")
  #     end
  #
  #     click_button("Edit")
  #     assert_equal "/robots/1/edit", current_path
  #
  #     fill_in 'robot[name]', with: "George Jones"
  #
  #     click_button("Edit")
  #     assert_equal "/robots/1", current_path
  #
  #     refute page.has_content?("George Carlin")
  #     assert page.has_content?("George Jones")
  #   end

end
