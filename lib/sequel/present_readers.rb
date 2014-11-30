module Sequel
  module Plugins
    module PresentReaders
      def self.configure(model, &block)
        model.instance_eval do
          send(:create_boolean_readers) if @dataset
        end
      end

      module ClassMethods
        Plugins.after_set_dataset(self, :create_boolean_readers)

        private

        # Add a attribute? method for the column to a module included in the class.
        def create_boolean_reader(column)
          overridable_methods_module.module_eval do
            define_method("#{column}?"){ send(column).present? }
          end
        end

        # Add attribute? methods for all of the boolean attributes for this model.
        def create_boolean_readers
          im = instance_methods.collect{|x| x.to_s}
          cs = columns rescue return
          cs.each{|c| create_boolean_reader(c) if !im.include?("#{c}?")}
        end
      end
    end
  end
end