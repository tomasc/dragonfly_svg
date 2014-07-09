require 'nokogiri'



module Dragonfly
  module Processors

    # Custom processors related to SVGs

    class SvgProcessor



      include Dragonfly::Configurable
      include Dragonfly::Shell
      include Dragonfly::Utils



      # ---------------------------------------------------------------------



      def set_namespace temp_object, namespace="http://www.w3.org/2000/svg"
        tempfile = new_tempfile :svg

        data = File.open(temp_object.path).read
        doc = Nokogiri::XML(data)

        if svg_node = doc.xpath("//*[name()='svg']").first
          unless svg_node.get_attribute 'xmlns'
            svg_node.set_attribute 'xmlns', namespace
          end
        end

        File.open(tempfile.path, 'w') { |f| f.write doc.to_xml }

        tempfile
      end



      # ---------------------------------------------------------------------



      def remove_namespaces temp_object
        tempfile = new_tempfile :svg

        data = File.open(temp_object.path).read
        doc = Nokogiri::XML(data)

        doc.remove_namespaces!

        File.open(tempfile.path, 'w') { |f| f.write doc.to_xml }

        tempfile
      end



      # ---------------------------------------------------------------------



      # Adds the 'preserveAspectRatio' attribute to the 'svg' node.
      # This allows the SVG to scale properly
      def preserve_aspect_ratio temp_object, value='xMinYMin meet'
        tempfile = new_tempfile :svg

        data = File.open(temp_object.path).read
        doc = Nokogiri::XML(data)

        if svg_node = doc.xpath("//*[name()='svg']").first
          svg_node.set_attribute 'preserveAspectRatio', value
        end

        File.open(tempfile.path, 'w') { |f| f.write doc.to_xml }

        tempfile
      end



      # ---------------------------------------------------------------------



      # Sets SVG viewBox attribute
      #
      # @param [Dragonfly::Tempfile]
      # @param [Number] min_x
      # @param [Number] min_y
      # @param [Number] width
      # @param [Number] height
      def set_view_box temp_object, min_x, min_y, width, height
        tempfile = new_tempfile :svg

        data = File.open(temp_object.path).read
        doc = Nokogiri::XML(data)

        value = [min_x, min_y, width, height].map(&:to_s).join(' ')

        if svg_node = doc.xpath("//*[name()='svg']").first
          svg_node.set_attribute 'viewBox', value
        end

        File.open(tempfile.path, 'w') { |f| f.write doc.to_xml }

        tempfile
      end



      # ---------------------------------------------------------------------



      # Sets SVG width and height attribute
      #
      # @param [Dragonfly::Tempfile]
      # @param [Number] width
      # @param [Number] height
      def set_dimensions temp_object, width, height
        tempfile = new_tempfile :svg

        data = File.open(temp_object.path).read
        doc = Nokogiri::XML(data)

        if svg_node = doc.xpath("//*[name()='svg']").first
          svg_node.set_attribute 'width', width if width.present?
          svg_node.set_attribute 'height', height if height.present?
        end

        File.open(tempfile.path, 'w') { |f| f.write doc.to_xml }

        tempfile
      end



      # ---------------------------------------------------------------------



      # Appends specified string to all SVG ids and their references
      # (SVG inlined in HTML has to have unique ids)
      #
      # FIXME: this would better first scan the svg for IDs and then update
      # references
      def extend_ids temp_object, append_str=SecureRandom.urlsafe_base64(8)
        tempfile = new_tempfile :svg

        data = File.open(temp_object.path).read
        doc = Nokogiri::XML(data)

        # nodes with id attributes
        doc.xpath("//*[@id]").each do |node|
          node_id = node.get_attribute 'id'
          node.set_attribute 'id', [node_id, append_str].join('-')
        end

        # nodes with id references
        doc.xpath("//*[@href]").each do |node|
          node_href = node.get_attribute 'href'
          node.set_attribute 'href', [node_href, append_str].join('-')
        end

        File.open(tempfile.path, 'w') { |f| f.write doc.to_xml }

        tempfile
      end



      # ---------------------------------------------------------------------



    end
  end
end