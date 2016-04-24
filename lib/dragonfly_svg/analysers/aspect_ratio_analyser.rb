module DragonflySvg
  module Analysers
    class AspectRatioAnalyser < Base
      def initialize(app)
        original = app.analysers.items[:aspect_ratio]
        app.add_analyser(:aspect_ratio) do |content|
          if is_svg?(content)
            attrs = content.analyse(:svg_properties)
            attrs[:width].to_f / attrs[:height]
          elsif original
            original.call(content)
          end
        end
      end
    end
  end
end
