require "rack"

class Redirect
  def initialize(app, from:, to:)
    @app = app
    @from = from
    @to = to
  end

  def call(env)
    if env["PATH_INFO"] == @from
      [301, {"Location" => @to}, []]
    else
      @app.call(env)
    end
  end
end

class App
  def call(env)
    if env["PATH_INFO"] == "/hello"
      status = 200
      headers = {"Content-Type" => "text/html"}
      body = ["<h1>Hello World!</h1>"]
      [status, headers, body]
    else
      status = 404
      headers = {"Content-Type" => "text/html"}
      body = ["<h1>Not Found</h1>"]
      [status, headers, body]
    end
  end
end

app = Rack::Builder.new {
  run Redirect.new(
    App.new,
    from: "/",
    to: "/hello"
  )
}

Rack::Handler::WEBrick.run app
