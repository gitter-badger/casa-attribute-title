# coding: utf-8

Gem::Specification.new do |s|

  s.name        = 'casa-attribute-title'
  s.version     = '0.0.01'
  s.summary     = 'Reference implementation of the CASA Protocol Title Attribute Specification'
  s.authors     = ['Eric Bollens']
  s.email       = ['ebollens@ucla.edu']
  s.homepage    = 'https://appsharing.github.io'
  s.license     = 'BSD-3-Clause'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_dependency 'casa-attribute'
  s.add_dependency 'casa-operation-filter'
  s.add_dependency 'casa-operation-squash'
  s.add_dependency 'casa-operation-transform'

  s.add_development_dependency 'rake'

end