require_relative '../config'
require_relative "#{ROOT_PATH}/config/db/db_connection"
Sequel::Model.plugin :validation_helpers
class WebserverLog < Sequel::Model
  def validate
    super
    validates_presence %i[ip url]
    validates_format /\b((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)(\.|$)){4}\b/, :ip, message: 'Ip Is not valid ip'
  end
end
