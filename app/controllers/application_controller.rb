class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def define_models
    @domesticwares = Domesticware.all
    @domesticware = Domesticware.first
  end
end
