class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def catch_404
    raise ActionController::RoutingError, ''
  end

  rescue_from StandardError do |e|
    render :file => 'public/500.html', :status => :internal_server_error, :layout => false
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render :file => 'public/404.html', :status => :not_found, :layout => false
  end

  rescue_from ActionController::RoutingError do |e|
    render :file => 'public/404.html', :status => :not_found, :layout => false
  end
end
