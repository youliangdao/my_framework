# frozen_string_literal: true

require 'uri'

class Router
  attr_accessor :routes

  def initialize
    @routes = []
  end

  def get(path, &block)
    @routes << Route.new(path: path, process: block, method: 'GET')
  end

  def bind!(url:, method:)
    # urlのpathの部分だけ取得 ex. `http://localhost:8080/hello` -> `/hello`
    path = URI.parse(url).path
    routes.find { |route| route.path == path && route.method == method }
  end

  class Route
    def initialize(path:, process:, method:)
      @path = path
      @process = process
      @method = method
    end

    attr_reader :path, :process, :method
  end
end
