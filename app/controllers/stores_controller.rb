class StoresController < ApplicationController
  before_action :authenticate_user!
  def new
    @store = Store.new
  end

  def create
    @store = current_user.build_store(store_params)
    if @store.save
      redirect_to @store , notice: 'Store was successfully created.'
    else
      render :new
    end
  end

  def show
    @store = current_user.store
    #@store = Store.find_by(id: params[:id])
    if @store.nil? || @store.id != params[:id].to_i
      flash.now[:alert] = "Store not found."
    end
  end


  private
  def store_params
    params.require(:store).permit(:name, :logo, :description, :address, :url, :currency, :timezone)
  end
end
