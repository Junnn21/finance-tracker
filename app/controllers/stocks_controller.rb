class StocksController < ApplicationController 
   
   def search
      if params[:stock_symbol][0].present?
         @stock = Stock.new_lookup(params[:stock_symbol][0])
         if @stock
            respond_to do |format|
               format.turbo_stream do
                  render turbo_stream: turbo_stream.update("result", partial: "users/result")
               end
            end
         else
            respond_to do |format|
               format.turbo_stream do
                  flash.now[:alert] = "Please enter a valid symbol to search"
                  render turbo_stream: turbo_stream.update("result", partial: "users/result")
               end
            end
         end
      else
         respond_to do |format|
            format.turbo_stream do
               flash.now[:alert] = "Please enter a symbol to search"
               render turbo_stream: turbo_stream.update("result", partial: "users/result")
            end 
         end
      end
   end
    
end