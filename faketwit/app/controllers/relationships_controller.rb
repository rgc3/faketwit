class RelationshipsController < ApplicationController
  # POST /relationships
  # POST /relationships.json
  def create
    @relationship = current_user.relationships.build(friend_id: params[:friend_id])
    if @relationship.save
      flash[:notice] = 'Followed successfully.'
      redirect_to request.referrer
    else
      flash[:notice] = 'Unable to follow.'
      redirect_to request.referrer
    end
  end

  def destroy
    @relationship = current_user.relationships.find(params[:id])
    @relationship.destroy
    flash[:notice] = 'No longer following.'
    redirect_to request.referrer
  end

  private
    # Never trust parameters from the internet, only allow the white list through.
    def relationship_params
      params.require(:relationship).permit(:user_id, :friend_id)
    end
end
