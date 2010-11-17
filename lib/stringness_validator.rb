module ActiveModel
  module Validations
    class StringnessValidator < EachValidator
      def validate_each(record, attribute, value)
        record.errors[attribute] << "must be a String, but is a #{value.class}" unless value.is_a?(String)
      end
    end

    module HelperMethods
      def validates_stringness_of *attr_names
        validates_with StringnessValidator, _merge_attributes(attr_names)
      end
    end
  end
end
