module Oped
  module Models
    module Mailer extend self
      def prompt!(post = Post.random)
        now  = Date.current
        text = "Just reply to this email with your entry."

        if post
          days = (now - post.created_at.to_date).round
          text += "\n\nOh snap, remember this? #{days} days ago you wrote...\n\n"
          text += post.body
        end

        Mail.deliver do
          to App.to_email
          from App.from_email
          subject "It's #{now.to_s(:wdm)} - How did your day go?"
          body text

          charset = 'UTF-8'
          content_transfer_encoding = '8bit'
        end
      end
    end
  end
end