require 'caracal/rails/template_handler'
require 'caracal/rails/version'


module Caracal
  module Rails
    class Railtie < ::Rails::Railtie
      
      #----------------------------------------------------
      # Register mime types and template handlers.
      #
      initializer 'caracal.registrations' do
        Tilt.register 'caracal', Tilt::CaracalTemplate

        unless Mime::Type.lookup_by_extension(:docx)
          Mime::Type.register('application/vnd.openxmlformats-officedocument.wordprocessingml.document', :docx)
        end

        ActiveSupport.on_load(:action_view) do
          ActionView::Template.register_template_handler :caracal, Caracal::Rails::TemplateHandler
        end
      end
      
    end
  end
end
