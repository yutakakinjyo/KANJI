class ProfilesController < ApplicationController

  def index
    @profile = Profile.new
  end

  def create
    profile = profile_params
    profile[:user_id] = @user.id
    @profile = Profile.new(profile)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to '/' }
      else
        format.html { render :new }
      end
    end
  end


  private
    def profile_params
      params.require(:profile).permit(:name, :mail)
    end


end
