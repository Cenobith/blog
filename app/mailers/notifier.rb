class Notifier < ApplicationMailer
  default from: ENV['gmail_username']
  #default from: "norifier@blog.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.commented.subject
  #
  def commented(comment)
    @comment = comment

    mail to: @comment.post.user.email, subject: "[Blog] Your post #{comment.post.title} was commented"
  end
end
