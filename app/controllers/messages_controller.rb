class MessagesController < ApplicationController
  def index
    @messages = Message.all
    render json: @messages, status: :ok
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      render json: nil, status: :ok
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private
  def message_params
    params
      .require(:message)
      .permit(:name, :theme, :email, :phone_number, :text)
  end
end
