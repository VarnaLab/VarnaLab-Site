module Extensions
  module SimpleForm
    module FormBuilder
      def parent_input(options = {})
        name = options.delete(:name_attribute) { :name }

        options[:collection] ||= template.nested_set_options(object.class, object) { |i| "#{'-' * i.level} #{i.send(name)}" }
        options[:prompt] ||= '-- no parent --'

        input :parent_id, options
      end
    end
  end
end

SimpleForm::FormBuilder.send :include, Extensions::SimpleForm::FormBuilder