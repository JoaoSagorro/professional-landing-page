class ResourcesController < ApplicationController
  def index
    # Allowed for every user (admin or not)
    @resources = Resource.all
  end

  def show
    # Allowed for every user (admin or not)
    @resource = Resource.find(params[:id])
  end

  def new
    # Allowed just for admin
    @resource = Resource.new
  end

  def create
    # Allowed just for admin
    @user = User.find(params[:user_id])
    @resource = Resource.new(set_params)
    @resource.user = @user
    @resource.save
    if @resource.save
      redirect_to resource_path(params[:id])
    else
      redirect_to :new, status: :unprocessable_entity
    end
  end

  def edit
    # Allowed just for admin
    @resource = Resource.find(params[:id])
  end

  def update
    # Allowed just for admin
    # Revisit this, not sure if correct
    @user = User.find(params[:user_id])
    @resource = Resource.update(set_params)
    @resource.user = @user
    @resource.save
  end

  def destroy
    # Allowed just for admin
  end

  private

  def set_params
    params.require(@resource).permit(:title, :category, :link)
  end

end
