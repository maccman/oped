module Oped
  module Models
    module Mailer extend self
      def prompt!(post = Post.random)
        now  = Time.current
        text = 'How was your day?'

        if post
          text += <<-EOF.dedent


            Here's a post from the past:
            ----------------------------

          EOF

          text += post.body
        end

        Mail.deliver do
          to App.to_email
          from App.from_email
          subject "How was your #{now.strftime('%A')}"
          body text

          charset = 'UTF-8'
          content_transfer_encoding = '8bit'
        end
      end
    end
  end
end