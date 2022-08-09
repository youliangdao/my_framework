# frozen_string_literal: true

require_relative './router.rb'
require_relative './application.rb'
require_relative './controller.rb'

def router
  @router ||= Router.new
end

def render(path)
  file_path = "./app/views/#{path}.erb"
  template_file = File.read(file_path)
  ERB.new(template_file).result
end
# `Application`のオブジェクトを生成する際に`router`を渡すようにしています。
at_exit { Application.new(router: @router).run! }
