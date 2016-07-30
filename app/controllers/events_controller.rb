class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_category_types, only: [:new, :edit]

  def index
    @events = current_user.events
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new 
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
 
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit
    end
  end

  def create
    @event = Event.new(event_params)
    
    if @event.save
      current_user.events << @event
   
      redirect_to events_path
    else
      render :new
    end
      
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
     
    redirect_to events_path 
  end

  private
  
  def event_params
    params.require(:event).permit(:category, :avatar)
  end

  private
  def get_category_types
    @category_types = CategoryType.where(by_admin: true)
  end
end