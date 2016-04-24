require 'test_helper'

module DragonflySvg
  module Processors
    describe SetAttribute do
      let(:app) { test_app.configure_with(:svg) }
      let(:processor) { DragonflySvg::Processors::SetAttribute.new }
      let(:analyser) { DragonflySvg::Analysers::SvgProperties.new }
      let(:svg) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }

      let(:xpath) { "./*[name()='svg']" }
      let(:attribute_name) { 'style' }
      let(:attribute_value) { 'margin: 50px;' }

      before do
        processor.call(svg, xpath, attribute_name, attribute_value)
      end

      it 'sets attribute' do
        Nokogiri::XML(svg.data).xpath(xpath).count.must_equal 1
        Nokogiri::XML(svg.data).xpath(xpath).first.get_attribute('style').must_equal attribute_value
      end
    end
  end
end
