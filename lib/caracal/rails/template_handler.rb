module Caracal
  module Rails
    class TemplateHandler

      def self.call(template, _source)
        "Tilt.new('#{ template.identifier }').render(self)"
      end

    end
  end
end
