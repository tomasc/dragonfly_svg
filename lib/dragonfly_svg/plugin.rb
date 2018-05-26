require 'dragonfly_svg/analysers/svg_properties'

require 'dragonfly_svg/processors/extend_ids'
require 'dragonfly_svg/processors/remove_namespaces'
require 'dragonfly_svg/processors/set_attribute'
require 'dragonfly_svg/processors/set_dimensions'
require 'dragonfly_svg/processors/set_namespace'
require 'dragonfly_svg/processors/set_preserve_aspect_ratio'
require 'dragonfly_svg/processors/set_view_box'

module DragonflySvg
  class Plugin
    def call(app, options = {})
      # Analysers
      app.add_analyser :svg_properties, Analysers::SvgProperties.new

      %w[ format
          width
          height
          id
      ].each do |name|
        app.add_analyser(name) { |c| c.analyse(:svg_properties)[name] }
      end

      app.add_analyser(:aspect_ratio) { |c| c.analyse(:width).to_f / c.analyse(:height).to_f }
      app.add_analyser(:portrait) { |c| c.analyse(:aspect_ratio) < 1.0 }
      app.add_analyser(:landscape) { |c| !c.analyse(:portrait) }

      # Aliases
      app.define(:portrait?) { portrait }
      app.define(:landscape?) { landscape }

      # Processors
      app.add_processor :extend_ids, Processors::ExtendIds.new
      app.add_processor :remove_namespaces, Processors::RemoveNamespaces.new
      app.add_processor :set_attribute, Processors::SetAttribute.new
      app.add_processor :set_dimensions, Processors::SetDimensions.new
      app.add_processor :set_namespace, Processors::SetNamespace.new
      app.add_processor :set_preserve_aspect_ratio, Processors::SetPreserveAspectRatio.new
      app.add_processor :set_view_box, Processors::SetViewBox.new
    end
  end
end

Dragonfly::App.register_plugin(:svg) { DragonflySvg::Plugin.new }
