require_dependency "soopli/application_controller"

module Soopli
  class ContractTypesController < ApplicationController
    before_action :set_contract_type, only: [:show, :edit, :update, :destroy]

    # GET /contract_types
    def index
      #@contract_types = ContractType.all
      @q = ContractType.ransack(params[:q])
      @contract_types = @q.result(distinct: true).page params[:page]
    end

    # GET /contract_types/1
    def show
    end

    # GET /contract_types/new
    def new
      @contract_type = ContractType.new
    end

    # GET /contract_types/1/edit
    def edit
    end

    # POST /contract_types
    def create
      @contract_type = ContractType.new(contract_type_params)

      if @contract_type.save
        redirect_to contract_types_path, notice: 'Contract type was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /contract_types/1
    def update
      if @contract_type.update(contract_type_params)
        redirect_to contract_types_path, notice: 'Contract type was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /contract_types/1
    def destroy
      @contract_type.destroy
      redirect_to contract_types_url, notice: 'Contract type was successfully destroyed.'
    end

    def versions
      #@versions = UserVersion.all.order('created_at desc').page params[:page]
      @q = ContractTypeVersion.ransack(params[:q])
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
      @q = ContractTypeVersion.ransack(params[:q])
      @versions = @q.result(distinct: true).order('id desc').page params[:page]

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @versions }
      end
    end
    
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contract_type
        @contract_type = ContractType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def contract_type_params
        params.require(:contract_type).permit(:name, :description)
      end
      
      def sort_column
        ContractType.column_names.include?(params[:sort]) ? params[:sort] : "name"
      end

      def sort_direction
        %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
      end
  end
end
