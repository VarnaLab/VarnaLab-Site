module RSpecSupport
  module ControllerHelpers
    def set_as_a_resource(model)
      controller.send :set_resource_ivar, model
    end
  end
end