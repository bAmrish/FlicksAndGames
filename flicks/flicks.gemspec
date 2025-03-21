Gem::Specification.new do |spec|
  spec.name       = "flicks"
  spec.version    = "2.0.0"
  spec.license    = "MIT"
  spec.author     = "AB Code Factory Corp Pvt Ltd "
  spec.summary    = "A command-line randomized movie reviewer."
  spec.homepage   = "https://github.com/bAmrish/FlicksAndGames/tree/main/flicks"
  
  spec.files      = Dir["{bin,lib}/**/*"] + %w"README.md LICENSE.txt"
  spec.executable = "flicks"

  spec.required_ruby_version = ">=3.3.5"
end