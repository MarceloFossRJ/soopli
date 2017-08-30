require_dependency "soopli/application_controller"

module Soopli
  class SupplierTypesController < ApplicationController
    before_action :set_supplier_type, only: [:show, :edit, :update, :destroy]

    # GET /supplier_types
    def index
      #@supplier_types = SupplierType.all
      @q = SupplierType.ransack(params[:q])
      @supplier_types = @q.result(distinct: true).page params[:page]
    end

    # GET /supplier_types/1
    def show
    end

    # GET /supplier_types/new
    def new
      @supplier_type = SupplierType.new
    end

    # GET /supplier_types/1/edit
    def edit
    end

    # POST /supplier_types
    def create
      @supplier_type = SupplierType.new(supplier_type_params)

      if @supplier_type.save
        redirect_to supplier_types_url, notice: 'Supplier type was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /supplier_types/1
    def update
      if @supplier_type.update(supplier_type_params)
        redirect_to supplier_types_url, notice: 'Supplier type was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /supplier_types/1
    def destroy
      @supplier_type.destroy
      redirect_to supplier_types_url, notice: 'Supplier type was successfully destroyed.'
    end

    def versions
      #@versions = UserVersion.all.order('created_at desc').page params[:page]
      @q = SupplierTypeVersion.ransack(params[:q])
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
      @q = SupplierTypeVersion.ransack(params[:q])
      @versions = @q.result(distinct: true).order('id desc').page params[:page]

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @versions }
      end
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_supplier_type
        @supplier_type = SupplierType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def supplier_type_params
        params.require(:supplier_type).permit(:name, :description)
      end
      
      
      def sort_column
        SupplierType.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
  end
end
