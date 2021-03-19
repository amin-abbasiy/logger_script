require_relative '../spec_helper'
RSpec.describe FileHandler do
  context "Successful Test" do
    it 'Read File Successfully' do
      data = FileHandler.new("webserver.log").log_reader
      expect(data.size).to eq(500)
    end
    it 'Read File Successfully' do
      data = FileHandler.new("webserver.log").log_reader
      expect(data.size).not_to eq(400)
    end
  end
end