require 'test_helper'

describe DragonflySvg::Processors::SetPreserveAspectRatio do
  let(:app) { test_app.configure_with(:svg) }
  let(:content) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }
  let(:processor) { DragonflySvg::Processors::SetPreserveAspectRatio.new }

  describe 'with default value' do
    before { processor.call(content) }
    it { content.data.must_include 'preserveAspectRatio' }
    it { content.data.must_include 'xMinYMin meet' }
  end

  describe 'with specified value' do
    before { processor.call(content, 'xMidYMid meet') }
    it { content.data.must_include 'xMidYMid meet' }
  end

  describe 'tempfile has extension' do
    before { processor.call(content) }
    it { content.tempfile.path.must_match /\.svg\z/ }
  end
end
