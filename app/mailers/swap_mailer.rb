class SwapMailer < ActionMailer::Base
  default from: 'brownsgiftswap@gmail.com'

  def swap_email(gifter, giftee, group)
    @gifter = gifter
    @giftee = giftee
    @group = group

    mail(to: @giftee.email,
         subject: "#{@gifter.name} - PUT A SOCK IN IT!")
  end
end
