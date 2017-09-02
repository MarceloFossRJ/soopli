require_dependency "soopli/application_controller"

module Soopli
  class SuppliersController < ApplicationController
    before_action :set_supplier, only: [:show, :edit, :update, :destroy]

    # GET /suppliers
    def index
      #@suppliers = Supplier.all
      @q = Supplier.ransack(params[:q])
      @suppliers = @q.result(distinct: true).page params[:page]
    end

    # GET /suppliers/1
    def show
    end

    # GET /suppliers/new
    def new
      @supplier = Supplier.new
    end

    # GET /suppliers/1/edit
    def edit
    end

    # POST /suppliers
    def create
      @supplier = Supplier.new(supplier_params)

      if @supplier.save
        redirect_to suppliers_path, notice: 'Supplier was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /suppliers/1
    def update
      if @supplier.update(supplier_params)
        redirect_to suppliers_path, notice: 'Supplier was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /suppliers/1
    def destroy
      @supplier.destroy
      redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.'
    end

    def versions
      #@versions = UserVersion.all.order('created_at desc').page params[:page]
      @q = SupplierVersion.ransack(params[:q])
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
      @q = SupplierVersion.ransack(params[:q])
      @versions = @q.result(distinct: true).order('id desc').page params[:page]

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @versions }
      end
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_supplier
        @supplier = Supplier.find(params[:id])
        @rag_statusable = @supplier
        @rag_statuses = @rag_statusable.rag_statuses
        @rag_status = RagStatus.new
      end

      # Only allow a trusted parameter "white list" through.
      def supplier_params
        params.require(:supplier).permit(:name, :website, :twitter, :linkedin, :facebook, :github, :instagram, :registration_country, :finantial_year, :relation_started_at, :status_id, :supplier_type_id, :internal_owner_id)
      end
      
      def sort_column
        Supplier.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
  end
end
