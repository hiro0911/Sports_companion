class InquiryMailer < ApplicationMailer
  # お問い合わせ時のメール設定
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      to: ENV.fetch("MAIL_ADDRESS"),
      subject: "お問い合わせ通知"
    ) 
  end
end
