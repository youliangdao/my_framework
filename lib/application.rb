require 'rack'

class Application

  def initialize(router:)
    @router = router
  end

  attr_reader :router

  def call(env)
    route = router.bind!(url: env['REQUEST_URI'], method: env['REQUEST_METHOD'])
    body = route.process.call
    ['200', {'Content-Type' => 'text/html'}, [body]]
  end

  def run!
    Rack::Handler::WEBrick.run self
  end
end
