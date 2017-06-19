class PortfolioController < ApplicationController
  def index
    @portfolio = PortfolioImage.all
    render json: @portfolio, status: :ok, include: ['image']
  end

  def create
    @portfolio = PortfolioImage.new(portfolio_params)
    if @portfolio.save
      render json: @portfolio, status: :created
    else
      render json: @portfolio.errors, status: :unprocessable_entity
    end
  end

  # TESTME
  def update
    @portfolio = PortfolioImage.find(params[:id])
    # I'm not sure if sending json back is needed
    # FIXME
    if @portfolio.update(portfolio_params)
      render json: @portfolio, status: :accepted
    else
      render json: @portfolio.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @portfolio = PortfolioImage.find(params[:id])
    if @portfolio.destroy
      render status: :no_content
    else
      render json: @portfolio.errors, status: :unprocessable_entity
    end
  end

  private 

  def portfolio_params
    params
      .require(:portfolio_image)
      .permit(:description, :image_id)
  end
end
