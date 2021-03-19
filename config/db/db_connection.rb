require 'sequel'
require 'logger'
require 'pg'
require_relative '../../config'
class Database
  def self.database_creation
    Sequel.connect(adapter: :postgres, user: ENV.fetch('DB_USER', 'postgres'),
                   password: ENV.fetch('DB_PASSWORD', 'apps'), host: ENV.fetch('DB_HOST', 'localhost'),
                   port: ENV.fetch('DB_PORT', '5432'), database: ENV.fetch('DB_NAME', 'script_logger')) do |db|
      db.execute('CREATE DATABASE script_logger;')
    end
  end
  DB = Sequel.connect(adapter: :postgres, user: ENV.fetch('DB_USER', 'postgres'),
                      password: ENV.fetch('DB_PASSWORD', 'apps'), host: ENV.fetch('DB_HOST', 'localhost'),
                      port: ENV.fetch('DB_PORT', '5432'), database: ENV.fetch('DB_NAME', 'script_logger'),
                      max_connections: 20, logger: Logger.new("#{ROOT_PATH}/log/db.log"))
  def connection; end

  def self.create_table
    DB.create_table :webserver_logs do
      primary_key :id
      String :url
      String :ip
    end
  end

  private
end
