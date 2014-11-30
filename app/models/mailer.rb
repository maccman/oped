module Oped
  module Models
    module Mailer extend self
      def prompt!(post = Post.random)
        text = erb(:'mailer/prompt')
        html = markdown(text)

        Mail.deliver do
          from  'Oped <bot@oped.io>'
          to    App.to_email

          subject  "How was your day?"

          body <<-EOF.dedent
            How was your day?
          EOF

          text_part do
            body text
          end

          html_part do
            content_type 'text/html; charset=UTF-8'
            body html
          end
        end
      end

      protected

      def erb(*args)
        app.erb(*args)
      end

      def markdown(*args)
        app.markdown(*args,
          fenced_code_blocks: true,
          smartypants: true,
          disable_indented_code_blocks: true,
          prettify: true,
          tables: true,
          with_toc_data: true,
          no_intra_emphasis: true
        )
      end

      def app
        App.new!
      end
    end
  end
end