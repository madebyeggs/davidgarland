class DomesticWaresController < ApplicationController
  #before_action :authenticate_user!, :except => ["index", "show"]
  
    def new
      @domesticWare = DomesticWare.new
    end

    def create
      @domesticWare = DomesticWare.create(domesticWare_params)
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end

    def edit
      @domesticWare = DomesticWare.find(params[:id])
    end

    def update   
      @domesticWare = DomesticWare.find(params[:id])
      if @domesticWare.update_attributes(domesticWare_params)
        respond_to do |format|
         format.html { redirect_to root_path }
         format.json { render :json => @domesticWare }
        end
      else
        respond_to do |format|
          format.html { render :action  => :edit } # edit.html.erb
          format.json { render :nothing =>  true }
        end
      end
    end

    def destroy
      @domesticWare = DomesticWare.find(params[:id])
      @domesticWare.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
      end
    end
    
    def domesticWare_params
      params.require(:domestic_ware).permit(:description1, :description2, :image)
    end
  
end