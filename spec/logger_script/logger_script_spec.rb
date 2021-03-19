require_relative '../spec_helper'
RSpec.describe LoggerScript do
  context 'Successful Result' do
    # File
    it 'when data back completely from file' do
      data = LoggerScript.new(['webserver.log'], 'file').log_parser
      expect(data).to include(result: [['/about/2', 90], ['/contact', 89], ['/index', 82], ['/about', 81], ['/help_page/1', 80], ['/home', 78]],
                              uniq_result: [['/index', 23], ['/home', 23], ['/contact', 23], ['/help_page/1', 23], ['/about/2', 22], ['/about', 21]])
    end
    it 'check for not empty result' do
      data = LoggerScript.new(['webserver.log'], 'file').log_parser
      expect(data).not_to be_empty
    end
    # Database
    it 'when data back completely from db' do
      data = LoggerScript.new(['webserver.log'], 'db').log_parser
      expect(data).to include(uniq_views: [['/index', 23], ['/home', 23], ['/help_page/1', 23], ['/contact', 23], ['/about/2', 22], ['/about', 21]],
                              views: [['/about/2', 90], ['/contact', 89], ['/index', 82], ['/about', 81], ['/help_page/1', 80], ['/home', 78]])
    end
    it 'when data back completely from db' do
      data = LoggerScript.new(['webserver.log'], 'db').log_parser
      expect(data).not_to be_empty
    end
  end
  context 'UnSuccessful Result' do
    # File
    it 'when data back broken from file' do
      data = LoggerScript.new(['webserver.log'], 'file').log_parser
      expect(data).not_to include(result: [['/about', 90], ['/contact', 89], ['/index', 82], ['/about', 81], ['/help_page/1', 80], ['/home', 78]],
                                  uniq_result: [['/index', 23], ['/home', 23], ['/contact', 23], ['/help_page/1', 23], ['/about/2', 22], ['/about', 20]])
    end
    it 'when validation raise for argument' do
      expect { LoggerScript.new(['webserver.log'], 'fil').log_parser }.to raise_exception(InputError)
    end
    it 'when validation raise for file' do
      expect { LoggerScript.new(['webserver.lg'], 'db').log_parser }.to raise_exception(InputError)
    end
    # Database
    it 'when data back broken from database' do
      data = LoggerScript.new(['webserver.log'], 'db').log_parser
      expect(data).not_to include(result: [['/about', 90], ['/contact', 89], ['/index', 82], ['/about', 81], ['/help_page/1', 80], ['/home', 78]],
                                  uniq_result: [['/index', 23], ['/home', 23], ['/contact', 23], ['/help_page/1', 23], ['/about/2', 22], ['/about', 20]])
    end
    it 'when validation raise for argument' do
      expect { LoggerScript.new(['webserver.log'], 'd').log_parser }.to raise_exception(InputError)
    end
    it 'when validation raise for database' do
      expect { LoggerScript.new(['webserver.lg'], 'db').log_parser }.to raise_exception(InputError)
    end
  end
end
