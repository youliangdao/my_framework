require_relative './lib/main.rb'

router.get "/" do
  "Hello MyFramework"
end

router.get '/hello' do |params|
  @body = params["word"] || "Hello World"
  render :index
end
