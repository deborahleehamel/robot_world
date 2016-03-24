require_relative '../test_helper'

class UserCanDeleteRobotTest < Minitest::Test
  include TestHelpers
  include Capybara::DSL

  def create_robot
     data = {
       name: "some name",
       city: "some city"
     }

     robot_world.create(data)
     @robot = robot_world.all.last
   end

  def test_robot_is_deleted
    data = {
      name: "Betty",
      city: "Atlanta"
      :state       => "Georgia",
      :birthdate   => "06-20-12",
      :date_hired  => "05-01-14",
      :department  => "Artificial Intelligence"}

      robot_world.create(data)
      robot = robot_world.all.first

      visit '/robots'

      click_link



    visit '/robots'
    within("#robots") do
      assert page.has_content? ("some name")
    end
    click_button("delete")
    within("#robots") do
      refute page.has_content? ("some name")
    end
  end
end
