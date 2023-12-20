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
    @resource =
  end

  def edit
    # Allowed just for admin
  end

  def update
    # Allowed just for admin
  end

  def destroy
    # Allowed just for admin
  end


end
