require_relative './lib/main.rb'

router.get '/hello' do |params|
  @body = params["word"]
  render :index
end
