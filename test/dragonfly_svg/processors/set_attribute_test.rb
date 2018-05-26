require 'test_helper'

describe DragonflySvg::Processors::SetAttribute do
  let(:app) { test_app.configure_with(:svg) }
  let(:processor) { DragonflySvg::Processors::SetAttribute.new }
  let(:analyser) { DragonflySvg::Analysers::SvgProperties.new }
  let(:content) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }

  let(:xpath) { "./*[name()='svg']" }
  let(:attribute_name) { 'style' }
  let(:attribute_value) { 'margin: 50px;' }

  before { processor.call(content, xpath, attribute_name, attribute_value) }

  it { Nokogiri::XML(content.data).xpath(xpath).count.must_equal 1 }
  it { Nokogiri::XML(content.data).xpath(xpath).first.get_attribute('style').must_equal attribute_value }
end
