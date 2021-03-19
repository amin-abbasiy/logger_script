require_relative '../config'
class FileHandler
  attr_accessor :output
  def initialize(file)
    @file = file
  end

  def log_writer(uri, ip)
    File.open("#{ROOT_PATH}/log/#{@file}", 'a') do |file|
      file.syswrite("#{uri} : #{ip} \n")
    end
  end

  def log_reader
    IO.readlines("#{ROOT_PATH}/log/#{@file}") do |line|
      puts line
    end
  end

  def output
    log_input_parser
  end

  private

  attr_reader :file
  def log_input_parser
    @var = []
    @result = {}
    @uniq_var = []
    @uniq_result = {}

    file_data = IO.readlines("#{ROOT_PATH}/log/#{@file[0]}")

    file_data.each { |var| @var << var.split(' ')[0] }
    @var.group_by { |i| i }.map { |k, v| @result[k] = v.count }

    file_data.uniq.each { |var| @uniq_var << var.split(' ')[0] }
    @uniq_var.group_by { |i| i }.map { |k, v| @uniq_result[k] = v.count }

    @output = { result: @result.sort_by { |_k, v| v }.reverse, uniq_result: @uniq_result.sort_by { |_k, v| v }.reverse }
  end
end
