Gem::Specification.new do |s|
  s.name         = "theantichris_studio_game"
  s.version      = "1.0.0"
  s.author       = "Christopher Lamm"
  s.email        = "christopherlamm81@gmail.com"
  s.homepage     = "https://github.com/theantichris"
  s.summary      = "A game created through The Pragmatic Studio Ruby course."
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README.md'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README.md)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'studio_game' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
end
