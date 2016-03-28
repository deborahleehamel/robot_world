require_relative '../test_helper'

class UserCanCreateRobotTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_with_valid_attributes
    visit '/'

    click_link 'Make a New Robot'

    assert_equal '/robots/new', current_path

    fill_in "robot[name]",       with: "Angela"
    fill_in "robot[city]",       with: "WheatRidge"
    fill_in "robot[state]",      with: "Colorado"
    fill_in "robot[avatar]",     with: "4442"
    fill_in "robot[birthdate]",  with: "05/28/1982"
    fill_in "robot[date_hired]", with: "05/26/2001"
    fill_in "robot[department]", with: "Pep Talk Operations"

    click_button 'Make this Robot'

    assert_equal '/robots', current_path
    assert page.has_content? 'Angela'
  end
end
