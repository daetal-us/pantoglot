
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pantoglot/version"

Gem::Specification.new do |spec|
  spec.name          = "pantoglot"
  spec.version       = Pantoglot::VERSION
  spec.authors       = ["Jon Adams"]
  spec.email         = ["jon@kuokoa.studio"]

  spec.summary       = "Analyze source code language, LOC and SLOC breakdown for a given filetree or file."
  spec.description   = "Given a path to a file or directory, excluding `.git` and its contents, symlinks, and any non-text files, attempt to identify the language and calculate the LOC/SLOC using Linguist and output results in JSON."
  spec.homepage      = "https://github.com/daetal-us/pantoglot"
  spec.license       = "MIT"

  spec.files         = Dir['lib/**/*'] + ['LICENSE']
  spec.executables   = ['pantoglot']
  spec.require_paths = ["lib"]

  spec.add_dependency 'github-linguist', '~> 6.0.1'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
