Sequel.default_timezone = :utc
Sequel.extension :core_extensions
Sequel::Model.raise_on_save_failure = false
Sequel::Model.plugin :timestamps, force: true
Sequel::Model.plugin :validation_helpers
Sequel::Model.plugin :serialization
Sequel::Model.plugin :dirty
Sequel::Model.plugin Sequel::Plugins::PresentReaders
Sequel::Model.plugin Sequel::Plugins::SaveHelpers

module Oped
  module Models
    autoload :Post, 'app/models/post'
    autoload :Mailer, 'app/models/mailer'
  end
end