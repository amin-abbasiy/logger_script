require_relative 'lib/logger_script/version'

Gem::Specification.new do |spec|
  spec.name          = 'logger_script'
  spec.version       = LoggerScriptMD::VERSION
  spec.authors       = ['Amin Abbasi']
  spec.email         = ['rubyprogrameramin@gmail.com']

  spec.summary       = 'Logging Script for Trace AppStack.'
  spec.description   = 'By Script You can log console & url requests.'
  spec.homepage      = 'https://www.rubygems.org'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['allowed_push_host'] = "'http://rubygems.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'http://rubydoc.info'
  spec.metadata['changelog_uri'] = 'http://rubydoc.info'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
