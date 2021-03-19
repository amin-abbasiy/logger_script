require_relative '../config/db/db_connection'
require_relative '../config'
class DbHandler
  attr_accessor :output
  def initialize(file)
    @file = file
  end

  def output
    fetch_data
  end

  def creator
    @database_hash = []
    file_data = IO.readlines("#{ROOT_PATH}/log/#{@file[0]}")
    # Database
    file_data.each { |var| @database_hash << { var.split(' ')[0] => var.split(' ')[1] } }
    webserver_logs = Database::DB[:webserver_logs]
    @database_hash.each do |k|
      k.each do |url, ip|
        webserver_logs.insert(url: url, ip: ip)
      end
    end
  end

  def cleaner
    Database::DB[:webserver_logs].delete
  end

  private

  attr_reader :file

  def fetch_data
    @regular = Database::DB.fetch('select url, count(*) from webserver_logs group by(webserver_logs.url) order by count(webserver_logs.url) desc;').map(%i[url count])
    @unique = Database::DB.fetch('select url, count(distinct(url, ip)) from webserver_logs group by(webserver_logs.url);').map(%i[url count]).sort_by { |_k, v| v }.reverse
    @output = { views: @regular, uniq_views: @unique }
  end
end
