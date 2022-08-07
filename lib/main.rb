# frozen_string_literal: true

require_relative './router.rb'
require_relative './application.rb'

def router
  @router ||= Router.new
end

# `Application`のオブジェクトを生成する際に`router`を渡すようにしています。
at_exit { Application.new(router: @router).run! }
