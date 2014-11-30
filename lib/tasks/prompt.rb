desc "Email Prompt"
task :prompt => :app do
  Mailer.prompt!
end