require 'sinatra'

def workshop_content(name)
  File.read("workshops/#{name}.txt")
rescue Errno::ENOENT
  return nil
end

get '/' do
  @files = Dir.entries('workshops')
  erb :home
end

get '/:name' do
  @name = params[:name]
  @description = workshop_content(@name)
  erb :workshop
end
