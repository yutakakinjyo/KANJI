class KanjiController < ApplicationController
  
  def index
    if user_signed_in?
      if Profile.find_by(user: @user)
        redirect_to '/plans'
      else
        redirect_to '/profiles'
      end
    else
      redirect_to '/users/sign_in'
    end
  end

end
