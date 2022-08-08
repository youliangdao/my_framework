require_relative './my_request.rb'
require 'rack'

class Application

  def initialize(router:)
    @router = router
  end

  attr_reader :router, :request

  def call(env)
    @request = MyRequest.new(env)
    route = router.bind!(url: request.url, method: request.method)
    body = route.process.call(request.params)
    ['200', {'Content-Type' => 'text/html'}, [body]]
  end

  def run!
    Rack::Handler::WEBrick.run self
  end
end
