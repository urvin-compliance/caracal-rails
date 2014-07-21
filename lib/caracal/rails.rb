require 'caracal/rails/version'
require 'caracal/rails/mixins/controller_methods'
require 'caracal/rails/mixins/view_methods'
require 'caracal/rails/template_handler'


module Caracal
  module Rails
    class Engine < Rails::Engine
      
      #----------------------------------------------------
      # Register mime types and template handlers.
      #
      initializer 'caracal.registrations' do
        Tilt.register_lazy :CaracalTemplate, 'tilt/caracal', 'caracal'
        # unless Mime::Type.lookup_by_extension(:docx)
        #   Mime::Type.register('application/vnd.openxmlformats-officedocument.wordprocessingml.document', :docx)
        # end
        #
        # ActiveSupport.on_load(:action_view) do
        #   ActionView::Template.register_template_handler :caracal, Caracal::Rails::TemplateHandler
        # end
      end
      
      #----------------------------------------------------
      # Add behaviors to core Rails components.
      #
      # config.to_prepare do
      #   ActionController::Base.send :include, Caracal::Rails::Mixins::ControllerMethods
      #   ActionView::Base.send       :include, Caracal::Rails::Mixins::ViewMethods
      # end
      
    end
  end
end
