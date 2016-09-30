class DomesticwaresController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @domesticware = Domesticware.new
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
       format.html { redirect_to cms_path }
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
      format.html { redirect_to cms_path }
    end
  end
  
  def update_row_order
    @domesticware = Domesticware.find(domesticware_params[:domesticware_id])
    @domesticware.row_order_position = domesticware_params[:row_order_position]
    @domesticware.save
    render nothing: true # this is a POST action, updates sent via AJAX, no view rendered
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_domesticware
    @set_domesticware = Domesticware.find(params[:id])
  end
  
  def domesticware_params
    params.require(:domesticware).permit(:domesticware_id, :row_order_position, :description1, :description2, :image)
  end
  
end
