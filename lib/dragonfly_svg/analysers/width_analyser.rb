module DragonflySvg
  module Analysers
    class WidthAnalyser < Base
      def initialize(app)
        original = app.analysers.items[:width]
        app.add_analyser(:width) do |content|
          if is_svg?(content)
            content.analyse(:svg_properties)[:width]
          elsif original
            original.call(content)
          end
        end
      end
    end
  end
end
