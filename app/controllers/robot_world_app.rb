require 'models/robot_world'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  # allow us to override original form methods
  set :method_override, true
  # use webrick instead of shotgun for debugging, requires restarts
  # set :server, 'webrick'

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_world.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
   robot_world.create(params[:robot])
   redirect '/robots'
 end

 get '/robots/:name' do |name|
    @robot = robot_world.find(name)
    erb :show
  end

  get '/robots/:name/edit' do |name|
    @robot = robot_world.find(name)
    erb :edit
  end

  put '/robots/:name' do |name|
    robot_world.update(name, params[:robot])
    @robot = robot_world.find(params["robot"]["name"])
    erb :show
    # redirect "/robots/#{name}"
  end

  delete '/robots/:name' do |name|
    robot_world.delete(name)
    redirect '/robots'
  end

  not_found do
    erb :error
  end

 def robot_world
   database = YAML::Store.new('db/robot_world')
   @robot_world ||= RobotWorld.new(database)
 end
end
