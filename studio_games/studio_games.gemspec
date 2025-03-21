Gem::Specification.new do |spec|
  spec.name       = "studio_games"
  spec.version    = "1.0.0"
  spec.license    = "MIT"
  spec.author     = "AB Code Factory Corp Pvt Ltd "
  spec.summary    = "A command-line randomized movie reviewer."
  spec.homepage   = "https://github.com/bAmrish/FlicksAndGames/tree/main/studio_games"
  
  spec.files      = Dir["{bin,lib}/**/*"] + %w"README.md LICENSE.txt"
  spec.executable = "studio_games"

  spec.required_ruby_version = ">=3.3.5"
end
