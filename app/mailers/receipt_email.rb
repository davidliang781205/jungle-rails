class ReceiptEmail < ActionMailer::Base
  default from: 'no-reply@jungle.com'

  def order_receipt(order)
    @order = order
    @line_items = LineItem.where(order_id: order.id)
    mail(to: @order.email, subject: "Order #: #{@order.id}")
  end
end
