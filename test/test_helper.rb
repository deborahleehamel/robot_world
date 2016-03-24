ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require "minitest/autorun"
require "minitest/pride"
require "capybara/dsl"
require "tilt/erb"

Capybara.app = RobotWorldApp


module TestHelpers
  def create_robots(num)
    num.times do |i|
      robot_world.create({
        name: "Robot #{i + 1}",
        city: "Denver #{i + 1}",
        state: "Colorado #{i + 1}",
        avatar: "444#{i + 1}",
        birthdate: "201#{i + 1}-06-27",
        date_hired: "200#{i + 1}-03-10",
        department: "Kindness Investigations #{i + 1}",
        })
      end
    end

  def teardown
    robot_world.delete_all
    super
  end

  def robot_world
    database = YAML::Store.new('db/robot-world_test')
    @robot_world ||= RobotWorld.new(database)
  end

  end
