class GoalsController < ApplicationController
  before_filter :authenticate_user!, except: :index
  before_filter :owner, only: [:edit, :update, :destroy]

  def index
    @goal = Goal.new
    @goals = Goal.all
  end

  def create
    @goal = Goal.new(params[:goal])
    @goal.user = current_user

    if @goal.save
      redirect_to @goal, notice: "Goal created."
    else
      render 'edit', notice: "Error, could not create."
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update_attributes(params[:goal])
      redirect_to @goal, notice: "Goal updated."
    else
      render 'edit', notice: "Error, not updated."
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    if @goal.destroy
      redirect_to goals_path, notice: "Goal deleted."
    else
      render @goal, notice: "Error, could not delete."
    end
  end

  private
  def owner
    if !user_signed_in? || current_user != Goal.find(params[:id]).user
      redirect_to goals_path, error: "Permission denied!"
    end
  end

end
