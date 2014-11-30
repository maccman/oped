module Oped
  module Routes
    class Posts < Base
      post '/posts' do
        p env
        200
      end
    end
  end
end