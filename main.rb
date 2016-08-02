
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'

require_relative 'db_config'
require_relative 'models/deal'
require_relative 'models/user'

enable :sessions

helpers do
  def logged_in?
    if User.find_by(id: session[:user_id])
      return true
    else
      return false
    end
  end

  def current_user
    User.find(session[:user_id])
  end
end

get '/' do

  @deals = Deal.all
  erb :index
end

get '/signup' do
  erb :signup
end

post '/signup' do

end

# routes for new users to add new deals
get '/deal/new' do
  erb :new
end

post '/deal/new' do
  deal = Deal.new
  deal.name = params[:name]
  deal.image_url = params[:image_url]
  deal.description = params[:desciption]
  deal.url = params[:url]
  deal.save
  redirect to '/'

  # after you get current user working
  # current_user << deal
end

get '/session/new' do #getting the form
  erb :login
end

post '/session' do #creating the resource

  # find the User with the email
  user = User.find_by(email: params[:email])

  # check the password to user
  if user && user.authenticate(params[:password])

    # good to go
    # sessions keep users IN session when they continue browsing from page to page
    session[:user_id] = user.id
    redirect to '/'
  else

    #show the login template
    erb :login
  end
end
