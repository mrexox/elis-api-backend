class ImagesController < ApplicationController
  def index
    @images = Image.all
    render json: @images, status: :ok
  end

  def create
    @image = Image.new
    # POST request should contain data after 'image' tag
    #
    # POST /admin/images HTTP/1.1
    # Host: localhost:3000
    # User-Agent: curl/7.47.0
    # Accept: */*
    # Content-Length: 549398
    # Expect: 100-continue
    # Content-Type: multipart/form-data;
    @image.image = params[:image]
    if @image.save
      render json: @image, status: :created
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      render status: :no_content
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end
end
