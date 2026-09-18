module Caracal
  module Rails
    class TemplateHandler
      
      def self.call(template, source = nil)
        "Tilt.new(#{ template.identifier.inspect }).render(self)"
      end
      
    end
  end
end
