require_relative "logger_script/version"
require_relative '../config'
load "file_handler.rb"
load 'db_handler.rb'
require 'byebug'
class InputError < StandardError; end

class LoggerScript
  include ::LoggerScriptMD

  attr_reader :log_file
  def initialize(log_file = ARGV[0], klass = ARGV[1])
    validation_data(log_file, klass)
    @log_file = log_file
    @klass = klass
  end
  def log_parser
    @data = Object.const_get(@klass.capitalize + "Handler").new(@log_file).output
    @data.each do |k,v|
      puts "#######################-Result For #{k.to_s.gsub('_', ' ').capitalize}-######################".ljust(68, "#")
      puts "| URL |".ljust(30, " ") + "| Views |".ljust(37, " ") + "$"
       "#{k} ------- #{v.each{|k,v| puts "#{k}".ljust(30, " ") + "#{v} Visits".ljust(37, " ") + "#" }} "
      puts "##############################-END-#################################"
    end
  end
  private
  def validation_data(filename, arg)
    raise InputError, "File #{filename[0]} Not Found" unless File.exists?("#{ROOT_PATH}/log/#{filename[0]}")
    raise InputError, "Input Data have not appropriate type" unless arg.is_a? ::String
    raise InputError, "Input Data have not right argument" unless arg == "file" || arg == "db"
  end
end

# log_input_parser(@log_file).each { |v| @var.store(v, @var[v] + 1) }
#
