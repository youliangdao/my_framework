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
    if route
      body = route.process.call(request.params)
      ['200', {'Content-Type' => 'text/html'}, [body]]
    else
      ["400", {"Content-Type" => "text/plain"}, ["Not Found"]]
    end
  end

  def run!
    Rack::Handler::WEBrick.run self, :Port => 9292
  end
end
