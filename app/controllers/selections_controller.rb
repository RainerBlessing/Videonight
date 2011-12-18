class SelectionsController < ApplicationController
  def rate
    @selection = Selection.find(params[:id])
    @selection.rate(params[:stars], current_user, params[:dimension])
    redirect_to '/'
  end  
end
