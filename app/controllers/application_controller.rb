class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def define_models
    @domesticwares = Domesticware.rank(:row_order).all
    @domesticware = Domesticware.first
  end
end
