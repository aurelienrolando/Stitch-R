class ReceiversController < ApplicationController
  def index
    @receivers = policy_scope(Receiver)
    @user = current_user
  end

  def new
    @user = current_user
    @receiver = Receiver.new
    authorize @receiver
  end

  def create
    @receiver = Receiver.new(receiver_params)
    @receiver.user = current_user
    if @receiver.save
      redirect_to user_receivers_path
    else
      render :new
    end
    authorize @receiver
  end

  private

  def receiver_params
    params.require(:receiver).permit(:email, :name)
  end


end
