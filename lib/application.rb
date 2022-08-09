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
    block = route.process.call
    controller = Controller.new(request.param)
    body = controller.define_action(block.split("#")[1])
    ['200', {'Content-Type' => 'text/html'}, [body]]
  end

  def run!
    Rack::Handler::WEBrick.run self, :Port => 9292
  end
end
