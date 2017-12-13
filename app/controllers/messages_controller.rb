# frozen_string_literal: true
class MessagesController < ApplicationController

  def index
    @messages = current_user.messages
    @message = Message.new
    sleep(3)
  end

  def show
    @message = Message.where(id: params[:id]).first
  end

  def destroy
    message = Message.where(id: params[:id]).first

    if message.destroy
      flash[:success] = "Your message has been deleted."
      redirect_to user_messages_path(user_id: current_user.id)
    else
      flash[:error] = "Could not delete message."
    end
  end

  def create
    if Message.create(message_params)
      respond_to do |format|
        format.html { redirect_to user_messages_path(user_id: current_user.id) }
        format.json { render json: {msg: "success"} }
      end
    else
      respond_to do |format|
        format.html { redirect_to user_messages_path }
        format.json { render json: {msg: "failure"} }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:creator_id, :message, :read, :receiver_id)
  end
end
