class EventsController < ApplicationController
  before_action :find_params, only: %i[show edit update destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @user = current_user
    @event = Event.new(set_params)
    @event.user = @user
    @event.save!
    if @event.save
      redirect_to event_path(params[:id])
    else
      redirect_to new_event, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @event = Event.update(set_params)
    @event.save!

  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def set_params
    params.require(:events).require(:title, :type, :description, :date)
  end

  def find_params
    @event = Event.find(params[:id])
  end
end
