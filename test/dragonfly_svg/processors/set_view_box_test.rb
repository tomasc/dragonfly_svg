require 'test_helper'

describe DragonflySvg::Processors::SetViewBox do
  let(:app) { test_app.configure_with(:svg) }
  let(:content) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }
  let(:processor) { DragonflySvg::Processors::SetViewBox.new }

  before { processor.call(content, 0, 0, 400, 600) }
  it { content.data.must_include '0 0 400 600' }

  describe 'tempfile has extension' do
    it { content.tempfile.path.must_match /\.svg\z/ }
  end
end
