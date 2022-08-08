# frozen_string_literal: true

require_relative './router.rb'
require_relative './application.rb'

def router
  @router ||= Router.new
end

def render(path)
  file_path = "./views/#{path}.erb"
  template_file = File.read(file_path)
  ERB.new(template_file).result
end
at_exit { Application.new(router: @router).run! }
