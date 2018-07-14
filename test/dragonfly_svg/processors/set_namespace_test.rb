require 'test_helper'

describe DragonflySvg::Processors::SetNamespace do
  let(:app) { test_app.configure_with(:svg) }
  let(:content) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }
  let(:processor) { DragonflySvg::Processors::SetNamespace.new }

  describe 'by default' do
    before { processor.call(content) }
    it { content.data.must_include 'http://www.w3.org/2000/svg' }
  end

  describe 'custom namespace' do
    before { processor.call(content, 'custom_namespace') }
    it { content.data.must_include 'custom_namespace' }
  end

  describe 'tempfile has extension' do
    before { processor.call(content) }
    it { content.tempfile.path.must_match /\.svg\z/ }
  end
end
