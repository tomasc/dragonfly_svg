require 'test_helper'

describe DragonflySvg::Plugin do
  let(:app) { test_app.configure_with(:svg) }
  let(:content) { app.fetch_file(SAMPLES_DIR.join('sample.svg')) }

  describe 'analysers' do
    it { content.svg_properties.must_equal('width' => 200.0, 'height' => 300.0, 'id' => 'sample_id') }
    it { content.width.must_equal 200.0 }
    it { content.height.must_equal 300.0 }
    it { content.aspect_ratio.round(2).must_equal 0.67 }
    it { content.must_be :portrait }
    it { content.must_be :portrait? }
    it { content.wont_be :landscape }
    it { content.wont_be :landscape? }
    it { content.id.must_equal 'sample_id' }
  end

  describe 'processors' do
    it { content.must_respond_to :extend_ids }
    it { content.must_respond_to :remove_namespaces }
    it { content.must_respond_to :set_attribute }
    it { content.must_respond_to :set_dimensions }
    it { content.must_respond_to :set_namespace }
    it { content.must_respond_to :set_preserve_aspect_ratio }
    it { content.must_respond_to :set_view_box }
  end
end
