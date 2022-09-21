class FriendsController < ApplicationController 
   
   def search
       if params[:friend][0].present?
            @friends = User.search(params[:friend][0])
            @friends = current_user.except_current_user(@friends)
            if @friends
                respond_to do |format|
                    format.turbo_stream do
                        render turbo_stream: turbo_stream.update("result", partial: "friends/result")
                    end
                end
            else
                respond_to do |format|
                    format.turbo_stream do
                        flash.now[:alert] = "Couldn't find user"
                        render turbo_stream: turbo_stream.update("result", partial: "friends/result")
                    end
                end
            end
        else
            respond_to do |format|
                format.turbo_stream do
                    flash.now[:alert] = "Please enter an email or a name to search"
                    render turbo_stream: turbo_stream.update("result", partial: "friends/result")
                end 
            end
        end
    end
    
end