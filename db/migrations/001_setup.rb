Sequel.migration do
  change do
    run 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";'

    create_table(:posts) do
      column :id, "uuid", :default=>Sequel::LiteralString.new("uuid_generate_v4()"), :null=>false
      column :iid, :serial, :null=>false

      column :subject, :text
      column :body, :text

      column :created_at, "timestamp without time zone"

      primary_key [:id]

      index [:iid], unique: true
    end
  end
end