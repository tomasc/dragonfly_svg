module DragonflySvg
  module Analysers
    class LandscapeAnalyser < Base

      def initialize(app)
        original = app.analysers.items[:landscape]
        app.add_analyser(:landscape) do |content|
          if is_svg?(content)
            attrs = content.analyse(:svg_properties)
            attrs[:width] >= attrs[:height]
          elsif original
            original.call(content)
          end
        end
      end
    end
  end
end
