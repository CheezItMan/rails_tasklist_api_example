class TodoController < ApplicationController
  before_filter :set_headers

  def index
    tasks = Todo.all

    render :json => tasks, :status => :ok
  end

  def show
    todo = Todo.find(params[:id].to_i)
    if todo
      render :json => todo, :status => :ok
    else
      render :json => [], :status => :no_content
    end
  end

  def create
    logger.debug "Create Params = #{params.to_s}"
    puts "Create Params = #{params.to_s}"
  end

  def update
    logger.debug "Create Params = #{params.to_s}"
    puts "Create Params = #{params.to_s}"
  end

  def destroy
    logger.debug "Create Params = #{params.to_s}"
    puts "Create Params = #{params.to_s}"
  end

  def search

  end

  private
    def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS, PATCH'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

end
