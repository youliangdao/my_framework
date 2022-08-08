require "rack"

class MyRequest < Rack::Request
  def initialize(env)
    super
    @url = env["REQUEST_URI"]
    @method = env['REQUEST_METHOD']
    @query = URI.parse(url).query
  end

  def param
    return unless query
    @params ||= Hash[URI.decode_www_form(query)]
  end

  attr_reader :url, :method, :query
end
