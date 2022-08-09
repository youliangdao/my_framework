class Controller
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def define_action(action)
    send(action)
  end

  def index
    @body = params["word"]
    render :index
  end
end
