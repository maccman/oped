namespace :prompt do
  desc "Email"
  task :email => :app do
    Mailer.prompt!
  end
end