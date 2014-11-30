module Oped
  module Models
    class Post < Sequel::Model
      def self.random
        order(:rand.sql_function).first
      end
    end
  end
end