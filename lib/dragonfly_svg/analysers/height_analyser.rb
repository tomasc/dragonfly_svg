module DragonflySvg
  module Analysers
    class HeightAnalyser < Base

      def initialize(app)
        original = app.analysers.items[:height]
        app.add_analyser(:height) do |content|
          if is_svg?(content)
            content.analyse(:svg_properties)[:height]
          elsif original
            original.call(content)
          end
        end
      end
    end
  end
end
