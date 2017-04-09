class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to user_session_path, :notice => 'if you want to add a notice'
        ## if you want render 404 page
        ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
      end
    end

end
