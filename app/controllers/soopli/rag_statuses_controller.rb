require_dependency "soopli/application_controller"

module Soopli
  class RagStatusesController < ApplicationController
    before_action :set_rag_status, only: [:show, :edit, :update, :destroy]

    # GET /rag_statuses
    def index
      @rag_statuses = RagStatus.all
    end

    # GET /rag_statuses/1
    def show
    end

    # GET /rag_statuses/new
    def new
      @rag_status = RagStatus.new
    end

    # GET /rag_statuses/1/edit
    def edit
    end

    # POST /rag_statuses
    def create
      @rag_status = RagStatus.new(rag_status_params)

      if @rag_status.save
        redirect_to @rag_status, notice: 'Rag status was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /rag_statuses/1
    def update
      if @rag_status.update(rag_status_params)
        redirect_to @rag_status, notice: 'Rag status was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /rag_statuses/1
    def destroy
      @rag_status.destroy
      redirect_to rag_statuses_url, notice: 'Rag status was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_rag_status
        @rag_status = RagStatus.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def rag_status_params
        params.require(:rag_status).permit(:name)
      end
  end
end
