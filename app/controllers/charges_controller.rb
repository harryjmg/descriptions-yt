class ChargesController < ApplicationController
  def new
  end

  def index
    redirect_to credit_index_path
  end

  def create
    # Amount in cents
    @amount = 990

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })

    if charge["paid"]
      current_user.credit_add(200)
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to credit_index_path
  end
end
