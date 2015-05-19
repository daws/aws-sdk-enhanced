require_relative 'lib/aws-sdk/enhanced/version'

Gem::Specification.new do |s|

  # definition
  s.name = %q{aws-sdk-enhanced}
  s.version = Aws::Enhanced::VERSION

  # details
  s.license = 'MIT'
  s.summary = %q{Extensions to aws-sdk to make it easier to use}
  s.description = %q{Extensions to aws-sdk, adding more natural access to attributes in AutoScaling, EC2, and more}
  s.author = 'David Dawson'
  s.email = %q{daws23@gmail.com}
  s.homepage = %q{https://github.com/daws/aws-sdk-enhanced}
  
  # documentation
  s.extra_rdoc_files = %w( README.rdoc CHANGELOG.rdoc LICENSE.txt )
  s.rdoc_options = %w( --main README.rdoc )

  # paths and files
  s.require_paths = [ 'lib' ]
  s.files = Dir[ 'lib/**/*.rb', 'README.rdoc', 'CHANGELOG.rdoc', 'LICENSE.txt' ]

  # dependencies
  s.add_runtime_dependency 'aws-sdk', '~> 2.0'

end
