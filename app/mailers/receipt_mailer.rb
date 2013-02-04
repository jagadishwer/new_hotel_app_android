class ReceiptMailer < ActionMailer::Base
  default :from=>"jagadish@hotelapp.com"
  def mail_receipt(user_email,attachment)
    email_attachment = PDFKit.new(attachment)
    attachments["Brilliance-works_Hotel_app_Receipt_#{Date.today}.pdf"] = email_attachment.to_pdf
      mail(:to => user_email, :subject => "Brilliance-works_Hotel_app Receipt")
    render :layout=>false
  end
  def mail_day_report(attachment)
    email_attachment = PDFKit.new(attachment)
    attachments["Day_report_#{Date.today}.pdf"] = email_attachment.to_pdf
      mail(:to => "bjtrails@gmail.com", :subject => "Brilliance-works_Hotel_app Day Report #{Date.today}")
    render :layout=>false
  end
end
