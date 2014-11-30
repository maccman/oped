module Oped
  module Routes
    class Posts < Base
      post '/posts' do
        Post.create!(
          subject: params[:subject],
          body:    params[:'stripped-text']
        )
        200
      end
    end
  end
end