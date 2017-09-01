require_dependency "soopli/application_controller"

module Soopli
  class PeopleController < ApplicationController
    before_action :set_person, only: [:show, :edit, :update, :destroy]
    before_action :set_classe

    # GET /people
    def index
      #@people = classe_class.all #Person.all
      
      @q = classe_class.ransack(params[:q])
      @people = @q.result(distinct: true).page params[:page]
    end

    # GET /people/1
    def show
    end

    # GET /people/new
    def new
      @person = classe_class.all.new #Person.new
    end

    # GET /people/1/edit
    def edit
    end

    # POST /people
    def create
      @person = Person.new(person_params)

      if @person.save
        redirect_to eval("#{@classe.pluralize}_path"), notice: "#{@classe.humanize} was successfully created."
      else
        render :new
      end
    end

    # PATCH/PUT /people/1
    def update
      if @person.update(person_params)
        redirect_to eval("#{@classe.pluralize}_path"), notice: "#{@classe.humanize} was successfully updated."
      else
        render :edit
      end
    end

    # DELETE /people/1
    def destroy
      @person.destroy
      redirect_to eval("#{@classe.pluralize}_path"), notice: "#{@classe.humanize} was successfully destroyed."
    end
    
    def versions
      #@versions = UserVersion.all.order('created_at desc').page params[:page]

      @q = PersonVersion.ransack(params[:q])
      @versions = @q.result(distinct: true).order('id desc').page params[:page]

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @versions }
      end
    end

    def version
#      if params[:q]== nil
#        params[:q] = { item_id_eq: params[:id] }
#      else
#        params[:q].merge({ item_id_eq: params[:id] })
#      end
      @q = PersonVersion.ransack(params[:q])
      @versions = @q.result(distinct: true).order('id desc').page params[:page]

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @versions }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_person
        @person = Person.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def person_params
        #params.require(:person).permit(:name, :email, :phone, :mobile, :position_id, :type)
        params.require(classe.underscore.partition("/").last.to_sym).permit(:name, :email, :phone, :mobile, :position_id, :type)
      end
      
      def sort_column
        classe_class.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
      
      #######
      
      def set_classe 
        @classe = classe.underscore.partition("/").last.to_s
      end

      def classe 
          ((params[:type]) ? params[:type] : "Person").classify
      end

      def classe_class 
          classe.constantize 
      end
  end
end
