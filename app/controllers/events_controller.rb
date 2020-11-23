class EventsController < ApplicationController
  include ApplicationHelper
  before_action :set_event, only: %i[show destroy]
   before_action :require_user, only: %i[new create]

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
def index
@event=Event.all
end
  def create
    @event = current_user.events.build(event_params)
    # @event = Event.new

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def update; end

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
