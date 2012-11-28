class TasksController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :update, :destroy, :create]

  def index
    @tasks = Task.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end


  def new
    @task =  current_user.tasks.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  def create
    @task = current_user.tasks.new(params[:task])
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'task was successfully created.' }
        format.json { render json: @task, status: :created, location: @node }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /sentences/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  def my
    @user = current_user
    @tasks = @user.tasks
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end


  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
end
