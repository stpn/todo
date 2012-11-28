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
    @task.soundtracks.build
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end


  def new
      @task = Task.new

      
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

    def create
      @task = Task.new(params[:task])
  

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

    # GET /sentences/1/edit
  def edit
    @task = Task.find(params[:id])
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
