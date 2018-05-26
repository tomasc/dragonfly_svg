require 'test_helper'

describe DragonflySvg::Processors::ExtendIds do
  let(:app) { test_app.configure_with(:svg) }
  let(:content) { Dragonfly::Content.new(app, SAMPLES_DIR.join('sample.svg')) }
  let(:analyser) { DragonflySvg::Analysers::SvgProperties.new }
  let(:processor) { DragonflySvg::Processors::ExtendIds.new }

  before { @orig_id = analyser.call(content)['id'] }

  describe 'default' do
    before { processor.call(content) }
    it { analyser.call(content)['id'].wont_equal @orig_id }
  end

  describe 'supplied string' do
    before { processor.call(content, 'foo') }
    it { analyser.call(content)['id'].must_equal "#{@orig_id}-foo" }
  end
end
