class SwapMailer < ActionMailer::Base
  default from: 'brownsgiftswap@gmail.com'

  def swap_email(gifter, giftee, group)
    @gifter = gifter
    @giftee = giftee
    @group = group

    mail(to: @gifter.email,
         subject: "#{@gifter.name} - Brown Family Gift Exchange")
  end
end
