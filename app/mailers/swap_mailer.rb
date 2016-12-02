class SwapMailer < ActionMailer::Base
  default from: 'fromcrockswap@gmail.com'

  def swap_email(gifter, giftee, group)
    @giftee = giftee

    mail(to: @gifteee.email,
         subject: "#{@gifter.name} - Here is your swapmate!")
  end
end
