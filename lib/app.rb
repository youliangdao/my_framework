require "rack"

class Application
  def run!
    app = Proc.new { |env| ['200', {'Content-Type' => 'text/html'}, ["<h1>Hello World</h1>"]] }
    Rack::Handler::WEBrick.run app
  end
end

Application.new.run!
