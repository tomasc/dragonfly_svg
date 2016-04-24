module DragonflySvg
  SVG_MIME_TYPE = "image/svg+xml".freeze

  module Analysers
    class Base
      def is_svg?(content)
        content.mime_type == DragonflySvg::SVG_MIME_TYPE
      end
    end
  end
end
