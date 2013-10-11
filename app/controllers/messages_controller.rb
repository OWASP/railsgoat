class MessagesController < ApplicationController

  def index
    @messages = Message.where(:receiver_id => current_user.id)
  end

  def show
    @message = Message.where(:id => params[:id])
  end

  def delete
  end

  def new
    @message = Message.new
  end

  def create
  end

end