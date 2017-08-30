require_dependency "soopli/application_controller"

module Soopli
  class CategoriesController < ApplicationController
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    # GET /categories
    def index
      #@categories = Category.all
      @q = Category.ransack(params[:q])
      @categories = @q.result(distinct: true).page params[:page]
    end

    # GET /categories/1
    def show
    end

    # GET /categories/new
    def new
      @category = Category.new
    end

    # GET /categories/1/edit
    def edit
    end

    # POST /categories
    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to categories_path, notice: 'Category was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /categories/1
    def update
      if @category.update(category_params)
        redirect_to categories_path, notice: 'Category was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /categories/1
    def destroy
      @category.destroy
      redirect_to categories_url, notice: 'Category was successfully destroyed.'
    end

    def versions
      #@versions = UserVersion.all.order('created_at desc').page params[:page]
      @q = CategoryVersion.ransack(params[:q])
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
      @q = CategoryVersion.ransack(params[:q])
      @versions = @q.result(distinct: true).order('id desc').page params[:page]

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @versions }
      end
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_category
        @category = Category.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(:name, :status_id)
      end
      
      def sort_column
        Category.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
  end
end
