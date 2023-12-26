class ResourcesController < ApplicationController
  before_action :find_params, only: %i[show edit update destroy]

  def index
    # Allowed for every user (admin or not)
    @resources = Resource.all
  end

  def show
    # Allowed for every user (admin or not)
  end

  def new
    # Allowed just for admin
    @resource = Resource.new
  end

  def create
    # Allowed just for admin
    @user = current_user
    @resource = Resource.new(set_params)
    @resource.user = @user
    @resource.save!
    if @resource.save
      redirect_to resource_path(@resource.id)
    else
      redirect_to :new, status: :unprocessable_entity
    end
  end

  def edit
    # Allowed just for admin
  end

  def update
    # Allowed just for admin
    # Revisit this, not sure if correct
    @user = current_user
    @resource = Resource.update(set_params)
    @resource.user = @user
    @resource.save
  end

  def destroy
    # Allowed just for admin
    @resource.destroy
    redirect_to resources_path
  end

  private

  def find_params
    @resource = Resource.find(params[:id])
  end

  def set_params
    params.require(:resource).permit(:title, :category, :link)
  end
end
