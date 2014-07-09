module Dragonfly
  module Analysers
    class SvgAnalyser



      include Dragonfly::Configurable
      include Dragonfly::Shell



      # ---------------------------------------------------------------------



      # @return [Float]
      def width temp_object
        return unless data = File.open(temp_object.path).read
        return unless doc = Nokogiri::XML(data)
        return unless svg_node = doc.xpath("//*[name()='svg']").first
        svg_node.get_attribute('width').to_f
      end

      # @return [Float]
      def height temp_object
        return unless data = File.open(temp_object.path).read
        return unless doc = Nokogiri::XML(data)
        return unless svg_node = doc.xpath("//*[name()='svg']").first
        svg_node.get_attribute('height').to_f
      end

      # @return [Float]
      def aspect_ratio temp_object
        width(temp_object) / height(temp_object)
      end



      # ---------------------------------------------------------------------



    end
  end
end