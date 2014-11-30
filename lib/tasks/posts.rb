namespace :posts do
  desc "Table List"
  task :table => :app do
    tp Post.all, :body, :created_at
  end

  desc "CSV List"
  task :csv => :app do
    require 'csv'

    csv = CSV.generate do |row|
      row << Post.columns

      Post.all.each do |post|
        row << post.values.values
      end
    end

    puts csv
  end
end