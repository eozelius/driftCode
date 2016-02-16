class DriftmapController < ApplicationController
  before_action :logged_in_user, only: :update
  before_action :correct_user

  def wizard
    @user = current_user
    render '_wizard'
    @user = current_user
  end

  def update
    user = current_user
    driftmap = params[:driftmap]
    # valid_driftmap(driftmap)

    if user.update_attribute(:driftmap, driftmap)
      user.save
      render json: {
        'status' => 'success',
        'redirect_url' => user_path(user),
        'new_driftmap' => user.driftmap
      }
    else
      render json: { 'status' => 'fail' }
    end
  end 

  private
    def valid_driftmap(driftmap)
      return true
    end

    def correct_user
      @user = current_user

      if current_user?(@user) || current_user.admin?
        return true
      else
        flash[:danger] = "You do not have permission to do that. wwjd?"
        redirect_to(root_path)
      end
    end


end