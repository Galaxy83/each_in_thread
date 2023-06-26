# frozen_string_literal: true

require_relative "lib/each_in_thread/version"

Gem::Specification.new do |spec|
  spec.name    = "each_in_thread"
  spec.version = EachInThread::VERSION
  spec.authors = ["Igor Novikov"]
  spec.email   = ["igor@novikov.icu"]

  spec.summary               = "A Ruby gem for running tasks on enumerables in separate threads"
  spec.description           = "EachInThread extends Ruby's Enumerable module to provide a simple, efficient way to run tasks in parallel by creating separate threads for each item in an enumerable."
  spec.homepage              = "https://github.com/your-github-username/each_in_thread"
  spec.license               = "MIT"
  spec.required_ruby_version = ">= 2.6.0"
  
  spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/Galaxy83"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/your-github-username/each_in_thread"
  spec.metadata["changelog_uri"]   = "https://github.com/your-github-username/each_in_thread/blob/main/CHANGELOG.md"

  spec.files         = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:\.gitignore|\.git|\.circleci|appveyor|bin|test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'thread', '0.1.0'
end
