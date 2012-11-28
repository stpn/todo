class ApplicationController < ActionController::Base
  protect_from_forgery


  rescue_from ActiveRecord::RecordInvalid, :with => :record_invalid

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def store_location
  session[:return_to] = request.url
end

def redirect_back_or_default(default)
  redirect_to(session[:return_to] || default)
  session[:return_to] = nil
end

def record_not_found
  flash[:notice] = "No such entry"
  redirect_to :root
end

def record_invalid
  flash[:error] = "Such entry already exists, try something else."
  redirect_to :root
end
end
