module RSpecSupport
  module ControllerHelpers
    def preform_update_on(model, options = {:successful => true})
      model.stub :update_attributes => options[:successful]
      controller.send :set_resource_ivar, model

      put :update, :id => model.id
    end

    def preform_create_on(model, options = {:successful => true})
      model.stub :save => options[:successful]
      controller.send :set_resource_ivar, model

      post :create
    end
  end
end