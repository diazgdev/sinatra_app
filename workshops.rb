require 'sinatra'

def workshop_content(name)
  File.read("workshops/#{name}.txt")
rescue Errno::ENOENT
  nil
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
