require 'sinatra'

def workshop_content(name)
  File.read("workshops/#{name}.txt")
rescue Errno::ENOENT
  nil
end

def save_workshop(name, description)
  File.open("workshops/#{name}.txt", 'w') do |file|
    file.print(description)
  end
end

get '/' do
  @files = Dir.entries('workshops')
  erb :home
end

get '/create' do
  erb :create
end

get '/:name' do
  @name = params[:name]
  @description = workshop_content(@name)
  erb :workshop
end

post '/create' do
  save_workshop(params['name'], params['description'])
end
