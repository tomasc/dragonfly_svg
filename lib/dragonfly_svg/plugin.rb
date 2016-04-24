require 'dragonfly_svg/analysers/base'
require 'dragonfly_svg/analysers/aspect_ratio_analyser'
require 'dragonfly_svg/analysers/height_analyser'
require 'dragonfly_svg/analysers/landscape_analyser'
require 'dragonfly_svg/analysers/portrait_analyser'
require 'dragonfly_svg/analysers/svg_properties'
require 'dragonfly_svg/analysers/width_analyser'
require 'dragonfly_svg/processors/extend_ids'
require 'dragonfly_svg/processors/remove_namespaces'
require 'dragonfly_svg/processors/set_attribute'
require 'dragonfly_svg/processors/set_dimensions'
require 'dragonfly_svg/processors/set_namespace'
require 'dragonfly_svg/processors/set_preserve_aspect_ratio'
require 'dragonfly_svg/processors/set_view_box'

module DragonflySvg
  class Plugin
    def call(app, _opts = {})
      app.add_analyser :svg_properties, DragonflySvg::Analysers::SvgProperties.new

      DragonflySvg::Analysers::WidthAnalyser.new(app)
      DragonflySvg::Analysers::HeightAnalyser.new(app)
      DragonflySvg::Analysers::AspectRatioAnalyser.new(app)
      DragonflySvg::Analysers::PortraitAnalyser.new(app)
      DragonflySvg::Analysers::LandscapeAnalyser.new(app)

      app.add_analyser :id do |content|
        content.analyse(:svg_properties)[:id]
      end

      # Aliases
      app.define(:portrait?) { portrait }
      app.define(:landscape?) { landscape }

      app.add_processor :extend_ids, DragonflySvg::Processors::ExtendIds.new
      app.add_processor :remove_namespaces, DragonflySvg::Processors::RemoveNamespaces.new
      app.add_processor :set_attribute, DragonflySvg::Processors::SetAttribute.new
      app.add_processor :set_dimensions, DragonflySvg::Processors::SetDimensions.new
      app.add_processor :set_namespace, DragonflySvg::Processors::SetNamespace.new
      app.add_processor :set_preserve_aspect_ratio, DragonflySvg::Processors::SetPreserveAspectRatio.new
      app.add_processor :set_view_box, DragonflySvg::Processors::SetViewBox.new
    end
  end
end

Dragonfly::App.register_plugin(:svg) { DragonflySvg::Plugin.new }
