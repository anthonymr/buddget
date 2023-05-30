class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @payment = current_user.payments.new
    @group = Group.find(params[:group_id])
  end

  def create
    @payment = current_user.payments.new(payment_params.except(:groups))
    pp payment_params[:type]
    @group = Group.find(params[:group_id])

    payment_params[:groups].each do |k, v|
      @payment.groups << Group.find(k) if v == '1'
    end

    if @payment.save
      redirect_to group_path(@group), notice: 'Payment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @payment = Payment.find(params[:id])
    @group = Group.find(params[:group_id])
  end

  def update
    @payment = Payment.find(params[:id])
    if @payment.update(payment_params)
      redirect_to group_path(@payment.group), notice: 'Payment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount, :author_id, groups: {})
  end
end
