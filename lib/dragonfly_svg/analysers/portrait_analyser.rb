module DragonflySvg
  module Analysers
    class PortraitAnalyser < Base

      def initialize(app)
        original = app.analysers.items[:portrait]
        app.add_analyser(:portrait) do |content|
          if is_svg?(content)
            attrs = content.analyse(:svg_properties)
            attrs[:width] <= attrs[:height]
          elsif original
            original.call(content)
          end
        end
      end
    end
  end
end
