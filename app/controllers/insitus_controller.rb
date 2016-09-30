class InsitusController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @insitu = Insitu.new
  end

  def create
    @insitu = Insitu.create(insitu_params)
    respond_to do |format|
      format.html { redirect_to get_in_situ_path }
    end
  end

  def edit
    @insitu = Insitu.find(params[:id])
  end

  def update   
    @insitu = Insitu.find(params[:id])
    if @insitu.update_attributes(insitu_params)
      respond_to do |format|
       format.html { redirect_to cms_path }
       format.json { render :json => @insitu }
      end
    else
      respond_to do |format|
        format.html { render :action  => :edit } # edit.html.erb
        format.json { render :nothing =>  true }
      end
    end
  end

  def destroy
    @insitu = Insitu.find(params[:id])
    @insitu.destroy
    respond_to do |format|
      format.html { redirect_to cms_path }
    end
  end

  private
  
  def insitu_params
    params.require(:insitu).permit(:description1, :description2, :image)
  end
  
end