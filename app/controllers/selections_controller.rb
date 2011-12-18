class SelectionsController < ApplicationController
  def rate
    @selection = Selection.find(params[:id])
    @selection.rate(params[:stars], current_user, params[:dimension])
    render events_path
  end  
end
