require_dependency "soopli/application_controller"

module Soopli
  class RagStatusesController < ApplicationController
    before_action :set_rag_status, only: [:show, :edit, :update, :destroy]

    # POST /rag_statuses
    def create
#      logger.debug "FIND_STATUSABLE= #{find_statusable}"
      @rag_statusable = find_statusable #Supplier.find(params[:supplier_id])
      @rag_status = @rag_statusable.rag_statuses.build(rag_status_params)

      if @rag_status.save
        redirect_to eval(find_path), notice: 'Rag status was successfully created.'
      else
        redirect_to eval(find_path), alert: 'Error.'
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
        params.require(:rag_status).permit(:rag_status, :description)
      end
      
      def find_statusable
        params.each do |name, value|
          if name =~ /(.+)_id$/
            a = 'Soopli::' + $1.classify
            return a.constantize.find(value)
          end
        end
        nil
      end
      
      def find_path
        params.each do |name, value|
          if name =~ /(.+)_id$/
            a = "edit_#{$1}_path(#{value})"
            return a #.constantize.find(value)
          end
        end
        nil
      end
  end
end
