module Oped
  module Routes
    class Posts < Base
      post '/posts' do
        Post.create!(
          subject: params[:subject],
          reply:   params[:'body-plain']
        )
        200
      end
    end
  end
end