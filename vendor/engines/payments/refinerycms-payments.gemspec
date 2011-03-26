Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-payments'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Payments engine for Refinery CMS'
  s.date              = '2011-03-26'
  s.summary           = 'Payments engine for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'config/**/*', 'app/**/*']
end
