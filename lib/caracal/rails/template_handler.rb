module Caracal
  module Rails
    class TemplateHandler
      
      def self.call(template, source = nil)
        "Tilt.new('#{ template.identifier }').render(self)"
      end
      
    end
  end
end
