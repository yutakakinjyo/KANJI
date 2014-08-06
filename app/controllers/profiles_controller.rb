class ProfilesController < ApplicationController
  before_action :set_profile, only: [:update, :index]

  def index
    @profile = Profile.new if @profile.nil?
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

  def update
    profile = profile_params
    profile[:user_id] = @user.id
    @profile.update(profile)

    respond_to do |format|
      format.html { render :show }
    end
  end


  private
    def profile_params
      params.require(:profile).permit(:name, :mail)
    end

    def set_profile
      @profile = Profile.find_by(user_id: @user.id)
    end


end
