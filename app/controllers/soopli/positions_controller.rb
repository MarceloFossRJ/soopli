require_dependency "soopli/application_controller"

module Soopli
  class PositionsController < ApplicationController
    before_action :set_position, only: [:show, :edit, :update, :destroy]

    # GET /positions
    def index
      #@positions = Position.all
      @q = Position.ransack(params[:q])
      @positions = @q.result(distinct: true).page params[:page]
    end

    # GET /positions/1
    def show
    end

    # GET /positions/new
    def new
      @position = Position.new
    end

    # GET /positions/1/edit
    def edit
    end

    # POST /positions
    def create
      @position = Position.new(position_params)

      if @position.save
        redirect_to positions_path, notice: 'Position was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /positions/1
    def update
      if @position.update(position_params)
        redirect_to positions_path, notice: 'Position was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /positions/1
    def destroy
      @position.destroy
      redirect_to positions_url, notice: 'Position was successfully destroyed.'
    end

    def versions
      #@versions = UserVersion.all.order('created_at desc').page params[:page]
      @q = PositionVersion.ransack(params[:q])
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
      @q = PositionVersion.ransack(params[:q])
      @versions = @q.result(distinct: true).order('id desc').page params[:page]

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @versions }
      end
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_position
        @position = Position.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def position_params
        params.require(:position).permit(:name)
      end
      
      def sort_column
        Position.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
  end
end
