module Caracal
  module Rails
    class TemplateHandler
      
      def self.call(template)
        "Tilt.new('#{ template.identifier }').render(self)"
      end
      
    end
  end
end
