# coding: utf-8
class TasksController < ApplicationController
  #-------#
  # index #
  #-------#
  def index
    @tasks = Task.where( user_id: session[:user_id] ).includes( :user ).order( "tasks.created_at DESC" ).all
  end

  #------#
  # show #
  #------#
  def show( id )
    @task = Task.where( id: id, user_id: session[:user_id] ).first
  end

  #-----#
  # new #
  #-----#
  def new
    @task = Task.new
  end

  #------#
  # edit #
  #------#
  def edit( id )
    @task = Task.where( id: id, user_id: session[:user_id] ).first
  end

  #--------#
  # create #
  #--------#
  def create( task )
    @task = Task.new( task )
    @task.user_id = session[:user_id]

    if @task.save
      redirect_to( tasks_path, notice: "Task was successfully created." )
    else
      render action: "new"
    end
  end

  #--------#
  # update #
  #--------#
  def update( id, task )
    @task = Task.where( id: id, user_id: session[:user_id] ).first

    if @task.update_attributes( task )
      redirect_to( task_path( @task ), notice: "Task was successfully updated." )
    else
      render action: "edit"
    end
  end

  #---------#
  # destroy #
  #---------#
  def destroy( id )
    task = Task.where( id: id, user_id: session[:user_id] ).first
    task.destroy ? flash[:notice] = "Task was successfully deleted." : flash[:alert] = "Task was failed deleted."

    redirect_to tasks_path
  end
end
