require_dependency "soopli/application_controller"

module Soopli
  class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :edit, :update, :destroy]

    # GET /teams
    def index
      #@teams = Team.all
      @q = Team.ransack(params[:q])
      @teams = @q.result(distinct: true).page params[:page]
    end

    # GET /teams/1
    def show
    end

    # GET /teams/new
    def new
      @team = Team.new
    end

    # GET /teams/1/edit
    def edit
    end

    # POST /teams
    def create
      @team = Team.new(team_params)

      if @team.save
        redirect_to teams_path, notice: 'Team was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /teams/1
    def update
      if @team.update(team_params)
        redirect_to teams_path, notice: 'Team was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /teams/1
    def destroy
      @team.destroy
      redirect_to teams_url, notice: 'Team was successfully destroyed.'
    end

    def versions
      #@versions = UserVersion.all.order('created_at desc').page params[:page]
      @q = TeamVersion.ransack(params[:q])
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
      @q = TeamVersion.ransack(params[:q])
      @versions = @q.result(distinct: true).order('id desc').page params[:page]

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @versions }
      end
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_team
        @team = Team.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def team_params
        params.require(:team).permit(:name, :description)
      end
      
      def sort_column
        Team.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
  end
end
