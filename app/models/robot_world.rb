require 'yaml/store'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def dataset
    database.from(:robots)
  end

  def create(robot)
    dataset.insert(robot)
  end

  # def raw_robots
  #   database.transaction do
  #     database['robots'] || []
  #   end
  # end

  def all
    dataset.all.to_a.map { |data| Robot.new(data) }
  end

 #  def raw_robot(id)
 #   raw_robots.find { |robot| robot["id"] == id }
 # end

 def find(id)
   data = dataset.where(:id => id).to_a.first
   Robot.new(data)
 end

 def update(data, id)
    dataset.where(:id => id).update(data)
  end

  def destroy(id)
    dataset.where(:id => id).delete
  end

  def destroy_all
    dataset.delete
  end


end
