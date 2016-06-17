class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
  use Rack::MethodOverride

  get '/' do
    erb :'application/root'
  end
end
