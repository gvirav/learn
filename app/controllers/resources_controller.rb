class ResourcesController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  
  def index
  	@resources = Resource.all
  	@resouce = Resource.new
  end

  def vote
    @resource = Resource.find(params[:id])
    @resource.votes += 1 if (params[:upvote] == "up")
    redirect_to resources_path
    @resource.save 
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def create
  	@resource = Resource.new(params[:resource])
  	@resource.user = current_user

  	if @resource.save
  		redirect_to resources_path, notice: "Resource added."
  	else
  		render action: "index", error: "Sorry, could not add."
  	end
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])

	  if @resource.update_attributes(params[:resource])
	  	redirect_to resources_path, notice: "Updated successfully."
	  else
	  	render action: "index", error: "Sorry, encountered error."
	  end
  end

  def destroy
    @resource = Resource.find(params[:id])
  	@resource.destroy

  	redirect_to resources_path, notice: "Deleted successfully."
  end

end
