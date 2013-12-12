Gem::Specification.new do |s|

  s.name        = 'casa-attribute-title'
  s.version     = '0.0.01'
  s.summary     = 'Reference implementation of the CASA Protocol Title Attribute Specification'
  s.authors     = ['Eric Bollens']
  s.email       = ['ebollens@ucla.edu']
  s.homepage    = 'https://appsharing.github.io/casa-protocol'
  s.license     = 'BSD-3-Clause'

  s.files       = ['lib/casa-attribute/title.rb']

  s.add_dependency 'casa-attribute'
  s.add_dependency 'casa-operation-squash'

  s.add_development_dependency 'rake'

end