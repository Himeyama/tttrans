# frozen_string_literal: true

require_relative "lib/tttrans/version"

Gem::Specification.new do |spec|
  spec.name = "tttrans"
  spec.version = TTTrans::VERSION
  spec.authors = ["MURATA Mitsuharu"]
  spec.email = ["hikari.photon+dev@gmail.com"]

  spec.summary = "This is a translation tool that uses the みんなの自動翻訳＠TexTra® API."
  spec.description = "#{spec.summary}\n「みんなの自動翻訳」and「TexTra」are registered trademarks of the NICT."
  spec.homepage = "https://github.com/himeyama/tttrans/"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "inifile", "~> 3.0.0"
  spec.add_dependency "oauth2", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0.6"
  spec.add_development_dependency "rubocop", "~> 1.30.1"
  spec.add_development_dependency "rubocop-rake", "~> 0.6.0"
end
