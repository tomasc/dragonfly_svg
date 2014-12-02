require 'dragonfly_svg/analysers/svg_properties'
require 'dragonfly_svg/processors/extend_ids'
require 'dragonfly_svg/processors/remove_namespaces'
require 'dragonfly_svg/processors/set_dimensions'
require 'dragonfly_svg/processors/set_namespace'
require 'dragonfly_svg/processors/set_preserve_aspect_ratio'
require 'dragonfly_svg/processors/set_view_box'

module DragonflySvg
  class Plugin

    def call app, opts={}
      app.add_analyser :svg_properties, DragonflySvg::Analysers::SvgProperties.new

      app.add_processor :extend_ids, DragonflySvg::Processors::ExtendIds.new
      app.add_processor :remove_namespaces, DragonflySvg::Processors::RemoveNamespaces.new
      app.add_processor :set_dimensions, DragonflySvg::Processors::SetDimensions.new
      app.add_processor :set_namespace, DragonflySvg::Processors::SetNamespace.new
      app.add_processor :set_preserve_aspect_ratio, DragonflySvg::Processors::SetPreserveAspectRatio.new
      app.add_processor :set_view_box, DragonflySvg::Processors::SetViewBox.new
    end

  end
end

Dragonfly::App.register_plugin(:svg) { DragonflySvg::Plugin.new }