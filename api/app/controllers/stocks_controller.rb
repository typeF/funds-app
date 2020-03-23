class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :update]

  # GET /stocks
  def index
    @stocks = Stock.all
    json_response(@stocks)
  end

  # GET /stocks/:id
  def show
    json_response(@stock)
  end

  # POST /stocks
  def create
    @stock = Stock.create!(stock_params)
    json_response(@stock, :created)
  end

  # PUT /stocks/:id
  def update
    @stock.update(stock_params)
    head :no_content
  end

  private

  def stock_params
    # whitelist params
    params.permit(:symbol, :function, :data)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end
end
