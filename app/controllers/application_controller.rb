class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def define_models
    @domesticwares = Domesticware.rank(:row_order).all
    respond_to do |format|
      format.html
      format.json {render :json => @domesticwares}
    end
    @domesticwaresdisplay = Domesticware.rank(:row_order).all
    @domesticware = Domesticware.rank(:row_order).first
    @studioceramics = Studioceramic.all
    @studioceramicsdisplay = Studioceramic.order("id ASC")
    @studioceramic = Studioceramic.first
    @insitus = Insitu.all
    @insitusdisplay = Insitu.order("id ASC")
    @insitu = Insitu.first
  end
end
