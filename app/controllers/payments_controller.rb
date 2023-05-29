class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @payment = current_user.payments.new(group_id: params[:group_id])
  end

  def create
    @payment = current_user.payments.new(payment_params.merge(group_id: params[:group_id]))

    if @payment.save
      redirect_to group_path(@payment.group), notice: 'Payment was successfully created.'
    else
      render :new, alert: 'Payment was not created.'
    end
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update(payment_params)
      redirect_to group_path(@payment.group), notice: 'Payment was successfully updated.'
    else
      render :edit, alert: 'Payment was not updated.'
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, :author_id, :group_id)
  end
end
