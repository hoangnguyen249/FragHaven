class CartController < ApplicationController
  def show
    @render_cart = false
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(product_id: @product.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity:)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(product: @product, quantity:)
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                   partial: 'cart/cart',
                                                   locals: { cart: @cart })
      end
    end
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('cart',
                                                  partial: 'cart/cart',
                                                  locals: { cart: @cart })
      end
    end
  end
  def checkout
    if current_user && current_user.province
        @cart.orderables.each do |orderable|
          order = Order.create!(
            product_id: orderable.product_id,
            quantity: orderable.quantity,
            created_at: orderable.created_at,
            updated_at: orderable.updated_at
          )

          UserOrder.create(user_id: current_user.id, order_id: order.id)
        end


        redirect_to cart_path, notice: "Checkout successful. Your order has been placed."
    else
      redirect_to cart_path, alert: "Please sign up or log in and update your address before checking out."
    end
  end
end