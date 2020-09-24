class ApplicationController < ActionController::Base
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path, :notice => 'You need to sign in or sign up before continuing.'
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end

  def after_sign_in_path_for(*)
    run_select_videos_path
  end

end
