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

        if payload['attributes'].has_key?(section) and payload['attributes'][section].has_key?(name)
          if options.include?('transform')
            option = options['transform']
            if option.is_a? Proc
              instance_run payload, option
            else
              payload['attributes'][section][name]
            end
          else
            payload['attributes'][section][name]
          end
        else
          nil
        end

      end

    end
  end
end