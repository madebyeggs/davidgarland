class DomesticwaresController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @domesticware = Domesticware.new
  end
  
  def index
    define_models
  end

  def create
    @domesticware = Domesticware.create(domesticware_params)
    respond_to do |format|
      format.html { redirect_to get_domestic_ware_path }
    end
  end

  def edit
    @domesticware = Domesticware.find(params[:id])
  end

  def update   
    @domesticware = Domesticware.find(params[:id])
    if @domesticware.update_attributes(domesticware_params)
      respond_to do |format|
       format.html { redirect_to get_domestic_ware_path }
       format.json { render :json => @domesticware }
      end
    else
      respond_to do |format|
        format.html { render :action  => :edit } # edit.html.erb
        format.json { render :nothing =>  true }
      end
    end
  end

  def destroy
    @domesticware = Domesticware.find(params[:id])
    @domesticware.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end

  private
  
  def domesticware_params
    params.require(:domesticware).permit(:description1, :description2, :image)
  end
  
end
