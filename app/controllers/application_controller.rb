class ApplicationController < ActionController::Base
  rescue_from Exception, with: :render_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
 
  
  def render_404
    render template: 'public/404', status: 404, layout: 'application', content_type: 'html'
  end
  
  def render_500
    render template: 'public/500', status: 500, layout: 'application', content_type: 'html'
  end




  before_action :configure_permitted_parameters, if: :devise_controller?

    

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :condition])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :condition])
    end


end
