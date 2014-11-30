module Oped
  module Models
    class Post < Sequel::Model
      def self.random
        order(:random.sql_function).first
      end

      def reply=(value)
        self.body = EmailReplyParser.parse_reply(value)
      end
    end
  end
end