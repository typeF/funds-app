class ShopsController < ApplicationController
  before_action :set_shop, only:[:show, :update, :destroy]

  # GET /shops
  def index
    @shops = Shop.all
    json_response(@shops)
  end

  # POST /shops
  def create
    @shop = Shop.create!(shop_params)
    json_response(@shop, :created)
  end

  # GET /shops/:id
  def show
    json_response(@shop)
  end

  # PUT /shops/:id
  def update
    @shop.update(shop_params)
    head :no_content
  end

  # DELETE /shops/:id
  def destroy
    @shop.destroy
    head :no_content
  end

  private

  def shop_params
    # whitelist params
    params.permit(:title, :location, :created_by)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end

end