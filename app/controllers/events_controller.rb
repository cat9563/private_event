class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @events = Event.find(params[:id])
  end

   def create
     @events = current_user.events.build(events_params)
     if @events.save
       flash[:success] = "Event Created!"
       redirect_to events_path
     else
       render 'new'
     end
   end

   def new
     @event = Event.new
   end

   private

   def events_params
     params.require(:event).permit(:title, :name, :description)
   end

end
