require 'test_helper'

describe DragonflySvg::Processors::SetTagValue do
  let(:app) { test_app.configure_with(:svg) }
  let(:processor) { DragonflySvg::Processors::SetTagValue.new }
  let(:analyser) { DragonflySvg::Analysers::SvgProperties.new }
  let(:content) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }

  let(:xpath) { "//*[name()='text']" }
  let(:value) { 'TEST' }

  before { processor.call(content, xpath, value) }

  it { Nokogiri::XML(content.data).xpath(xpath).count.must_equal 1 }
  it { Nokogiri::XML(content.data).xpath(xpath).first.inner_html.must_equal value }

  describe 'tempfile has extension' do
    it { content.tempfile.path.must_match /\.svg\z/ }
  end
end
