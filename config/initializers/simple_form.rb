# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :error_class => :fieldWithError do |b|

    # Components used by the form builder to generate a complete input. You can remove
    # any of them, change the order, or even add your own components to the stack.
    b.use :placeholder
    b.use :label_input
    b.use :error, :wrap_with => { :error_notification_class => 'error-notification'}
    b.use :hint,  :wrap_with => { :tag => :span}
    
    # How the label text should be generated altogether with the required text.
    #b.label_text = lambda { |label, required| "#{label}<span>:</span> #{required}" }

    # Default size for text inputs.
    #b.default_input_size = 30

    # When false, do not use translations for labels, hints or placeholders.
    # config.translate = true
    #b.browser_validations = false
  end
end