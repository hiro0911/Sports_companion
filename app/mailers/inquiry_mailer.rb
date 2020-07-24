class InquiryMailer < ApplicationMailer
  default from: "system@example.com"
  # お問い合わせ時のメール設定
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      to: ENV['MAIL_ADDRESS'],
      subject: 'お問い合わせ通知'
    ) do |fomat|
      fomat.text
    end
  end
end
