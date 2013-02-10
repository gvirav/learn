class CheckpointsController < ApplicationController
  before_filter :authenticate_user!, except: :index
  before_filter :owner, only: [:edit, :update, :destroy]
  def index
    @checkpoints = Checkpoint.all
  end

  def new
    @goal = Goal.find(params[:goal_id])
    @checkpoint = Checkpoint.new
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @checkpoint = @goal.checkpoints.new(params[:checkpoint])

    if @checkpoint.save
      redirect_to goal_checkpoint_path(@goal, @checkpoint), notice: "Checkpoint added."
    else
      render "index", flash[:error] = "Error, could not add checkpoint."
    end
  end

  def show
    @checkpoint = Checkpoint.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:goal_id])
    @checkpoint = Checkpoint.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:goal_id])
    @checkpoint = Checkpoint.find(params[:id])
    @goal = @checkpoint.goal

    if @checkpoint.update_attributes(params[:checkpoint])
      redirect_to goal_checkpoint_path(@goal, @checkpoint)
    else
      render action: 'edit'
    end
  end

  def destroy
    @checkpoint = Checkpoint.find(params[:id])
    @checkpoint.destroy
    if @checkpoint.destroy
      redirect_to checkpoints_path
    else
      redirect_to @checkpoint, notice: "Error, could not delete."
    end
  end

  private
  def owner
    if !user_signed_in? || current_user != Goal.find(params[:id]).user
      redirect_to goals_path, error: "Permission denied!"
    end
  end
  
end
