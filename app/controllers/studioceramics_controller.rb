class StudioceramicsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @studioceramic = Studioceramic.new
  end

  def create
    @studioceramic = Studioceramic.create(studioceramic_params)
    respond_to do |format|
      format.html { redirect_to get_studio_ceramics_path }
    end
  end

  def edit
    @studioceramic = Studioceramic.find(params[:id])
  end

  def update   
    @studioceramic = Studioceramic.find(params[:id])
    if @studioceramic.update_attributes(studioceramic_params)
      respond_to do |format|
       format.html { redirect_to cms_path }
       format.json { render :json => @studioceramic }
      end
    else
      respond_to do |format|
        format.html { render :action  => :edit } # edit.html.erb
        format.json { render :nothing =>  true }
      end
    end
  end

  def destroy
    @studioceramic = Studioceramic.find(params[:id])
    @studioceramic.destroy
    respond_to do |format|
      format.html { redirect_to cms_path }
    end
  end

  private
  
  def studioceramic_params
    params.require(:studioceramic).permit(:description1, :description2, :image)
  end
  
end