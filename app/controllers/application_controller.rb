class ApplicationController < ActionController::Base

  before_action :redirect_lp_to_root

  def redirect_lp_to_root
    if request.path.end_with?('/landing_page')
      redirect_to :root
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end
  
end
