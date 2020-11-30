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
    if logged_in?
    @past_events = current_user.events.past
    @upcoming_events = current_user.events.upcoming
    else
      @past_events = Event.past
      @upcoming_events = Event.upcoming
    end
  end

  def create
    @event = current_user.events.build(event_params)
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

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
