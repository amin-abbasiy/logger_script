require_relative '../spec_helper'
RSpec.describe DbHandler do
  context 'Successful Test' do
    it 'creation where successful' do
      data = DbHandler.new(['webserver.log']).cleaner
      expect(data).to be(500)
    end
    it 'creation where successful' do
      data = DbHandler.new(['webserver.log']).creator
      expect(data).not_to be_empty
    end
  end
  context 'UnSuccessful Test' do
    it 'creation where successful' do
      expect { DbHandler.new(['dd.log']).creator }.to raise_exception(Errno::ENOENT)
    end
  end
end
