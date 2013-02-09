class CheckpointsController < ApplicationController
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
      redirect_to goal_path(@checkpoint.goal, @goal), notice: "Checkpoint added."
    else
      render "index", flash[:error] = "Error, could not add checkpoint."
    end
  end

  def show
    @checkpoint = Checkpoint.find(params[:id])
  end

  def edit
    @checkpoint = Checkpoint.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:goal_id])
    @checkpoint = Checkpoint.find(params[:id])

    if @checkpoint.update_attributes(params[:checkpoint])
      redirect_to goal_checkpoint_path(@checkpoint)
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
end
