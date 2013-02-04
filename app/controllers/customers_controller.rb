class CustomersController < ApplicationController
  def email_receipt
@customer=Customer.find_by_serial_no(params["serial_no"])
    @orders=@customer.orders
    @tax = Tax.all
    
  respond_to do|format|
      format.html {
        attachment = render_to_string(:action => 'show',:layout => false)
    ReceiptMailer.mail_receipt(params[:email_id],attachment).deliver
      }
      format.json {
        show
       render :json=>true
      }
      format.xml{
        attachment = render_to_string(:action => 'show',:layout => false)
    ReceiptMailer.mail_receipt(params[:email_id],attachment).deliver
      }
    end
  end
private
def show
   @customer=Customer.find_by_serial_no(params["serial_no"])
    @orders=@customer.orders
    @tax = Tax.all
    attachment = render_to_string(:action => 'show',:layout => false,:formats=>[:html])
    ReceiptMailer.mail_receipt(params[:email_id],attachment).deliver
    return
   end
end
