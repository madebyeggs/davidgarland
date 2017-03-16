class CmsController < ApplicationController
  before_action :authenticate_user!

  
  def index
    define_models
  end

end