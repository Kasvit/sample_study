class ServicesController < ApplicationController
  before_action :find_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def show
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      reditect_to service_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to services_path
    else
      render "edit"
    end
  end

  def destroy
    @service.destroy
    redirect_to services_path
  end

  private
  def service_params
    params.requre(:service).permit(:name)
  end

  def find_item
    @service = Service.find(params[:id])
  end
end
