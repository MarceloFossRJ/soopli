require_dependency "soopli/application_controller"

module Soopli
  class EntitiesController < ApplicationController
    before_action :set_entity, only: [:show, :edit, :update, :destroy]

    # GET /entities
    def index
      #@entities = Entity.all
      @q = Entity.ransack(params[:q])
      @entities = @q.result(distinct: true).page params[:page]
    end

    # GET /entities/1
    def show
    end

    # GET /entities/new
    def new
      @entity = Entity.new
    end

    # GET /entities/1/edit
    def edit
    end

    # POST /entities
    def create
      @entity = Entity.new(entity_params)

      if @entity.save
        redirect_to entities_path, notice: 'Entity was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /entities/1
    def update
      if @entity.update(entity_params)
        redirect_to entities_path, notice: 'Entity was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /entities/1
    def destroy
      @entity.destroy
      redirect_to entities_url, notice: 'Entity was successfully destroyed.'
    end
    
    def versions
      #@versions = UserVersion.all.order('created_at desc').page params[:page]
      @q = EntityVersion.ransack(params[:q])
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
      @q = EntityVersion.ransack(params[:q])
      @versions = @q.result(distinct: true).order('id desc').page params[:page]

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @versions }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_entity
        @entity = Entity.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def entity_params
        params.require(:entity).permit(:name, :status_id, :registration_name, :website, :twitter, :linkedin, :finantial_year, :internal_owner_id)
      end
      
      def sort_column
        Entity.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
  end
end
