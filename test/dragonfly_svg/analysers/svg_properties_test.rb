require 'test_helper'

describe DragonflySvg::Analysers::SvgProperties do
  let(:app) { test_app.configure_with(:svg) }
  let(:analyser) { DragonflySvg::Analysers::SvgProperties.new }
  let(:svg) { app.fetch_file(SAMPLES_DIR.join('sample.svg')) }

  it { analyser.call(svg).must_be_kind_of Hash }
  it { analyser.call(svg)['width'].must_equal 200 }
  it { analyser.call(svg)['height'].must_equal 300 }
  it { analyser.call(svg)['id'].must_equal 'sample_id' }

  describe 'when dimensions only in viewBox' do
    let(:svg) { app.fetch_file(SAMPLES_DIR.join('sample_without_dimensions.svg')) }

    it { analyser.call(svg)['width'].must_equal 200 }
    it { analyser.call(svg)['height'].must_equal 300 }
  end
end
