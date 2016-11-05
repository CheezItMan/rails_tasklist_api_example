class TodoController < ApplicationController
  before_action :find_todo, only: [:show, :update, :destroy]

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
    logger.debug "Update Params = #{params.to_s}"
    puts "Update Params = #{params.to_s}"

    id = params[:id].to_i

    todo = Todo.find_by(id: id)
    if todo
      if params[:name]
        todo.name = params[:name]
      end
      if params[:description]
        todo.description = params[:description]
      end
      if params[:completed]
        todo.completed = str_to_bool(params[:completed])
      end

      if todo.save
        render :json => {ok: true}, :status => :ok
      else
        render :json => {ok: false}, :status => :internal_server_error
      end
    else
      render :json => {ok: false}, :status => :not_found
    end

  end

  def destroy
    logger.debug "Create Params = #{params.to_s}"
    logger.debug "Todo's name = #{@todo.name}"
    if @todo
      if @todo.destroy
        render :json => {ok: true}, :status => :ok
      else
        render :json => {ok: false}, :status => :internal_server_error
      end
    else
      render :json => {ok: false}, :status => :not_found
    end
  end

  def search

  end

  private
    def set_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, delete'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    end

    def str_to_bool(str)
      return str == "true"
    end

    def find_todo
      @todo = Todo.find_by(id: params[:id].to_i)
      logger.debug "@todo = #{@todo.id}"
      logger.debug "Params = #{params}"
    end

end
