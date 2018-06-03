require 'test_helper'

describe DragonflySvg::Processors::SetDimensions do
  let(:app) { test_app.configure_with(:svg) }
  let(:content) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }
  let(:processor) { DragonflySvg::Processors::SetDimensions.new }
  let(:analyser) { DragonflySvg::Analysers::SvgProperties.new }

  before { processor.call(content, 400, 600) }

  it { analyser.call(content)['width'].must_equal 400 }
  it { analyser.call(content)['height'].must_equal 600 }

  describe 'tempfile has extension' do
    it { content.tempfile.path.must_match /\.svg\z/ }
  end
end
