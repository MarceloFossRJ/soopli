require_dependency "soopli/application_controller"

module Soopli
  class EventTypesController < ApplicationController
    before_action :set_event_type, only: [:show, :edit, :update, :destroy]

    # GET /event_types
    def index
      #@event_types = EventType.all
      @q = EventType.ransack(params[:q])
      @event_types = @q.result(distinct: true).page params[:page]
    end

    # GET /event_types/1
    def show
    end

    # GET /event_types/new
    def new
      @event_type = EventType.new
    end

    # GET /event_types/1/edit
    def edit
    end

    # POST /event_types
    def create
      @event_type = EventType.new(event_type_params)

      if @event_type.save
        redirect_to event_types_url, notice: 'Event type was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /event_types/1
    def update
      if @event_type.update(event_type_params)
        redirect_to event_types_url, notice: 'Event type was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /event_types/1
    def destroy
      @event_type.destroy
      redirect_to event_types_url, notice: 'Event type was successfully destroyed.'
    end
    
    def versions
      #@versions = UserVersion.all.order('created_at desc').page params[:page]
      @q = EventTypeVersion.ransack(params[:q])
      @versions = @q.result(distinct: true).order('id desc').page params[:page]

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @versions }
      end
    end

    def version
      if params[:q]== nil
        params[:q] = { item_id_eq: params[:id] }
      else
        params[:q].merge({ item_id_eq: params[:id] })
      end
      @q = EventTypeVersion.ransack(params[:q])
      @versions = @q.result(distinct: true).order('id desc').page params[:page]

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @versions }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_event_type
        @event_type = EventType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def event_type_params
        params.require(:event_type).permit(:name, :description)
      end
      
      def sort_column
        EventType.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
  end
end
