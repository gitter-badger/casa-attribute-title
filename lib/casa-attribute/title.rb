require 'casa-attribute/definition'
require 'casa-operation/squash/strategy/use_latest'

module CASA
  module Attribute
    class Title < Definition

      uuid '1f2625c2-615f-11e3-bf13-d231feb1dc81'

      section 'use'

      squash CASA::Operation::Squash::Strategy.use_latest

      filter do |payload|
        true
      end

      transform do |payload|
        payload
      end

    end
  end
end