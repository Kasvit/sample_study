class FrontendController < ApplicationController

  def index
    
  end

  def show
    
  end

  def logo
  
  end

  def cargoes
    
  end

  def dashboard_screenshot
    @users = User.all
  end

  def droplet_screenshot
    
  end

  def status_bar
    ProgressBarJob.perform_later
    head :ok
  end
end
