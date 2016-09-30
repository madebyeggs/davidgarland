class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def define_models
    @domestic_wares = DomesticWare.all
    @domestic_ware = DomesticWare.first
  end
end
