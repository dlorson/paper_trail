require 'test_helper'

class PaperTrailTest < ActiveSupport::TestCase
  test 'Sanity test' do
    assert_kind_of Module, PaperTrail
  end

  test 'create with plain model class' do
    widget = Widget.create
    assert_equal 1, widget.modifications.length
  end

  test 'update with plain model class' do
    widget = Widget.create
    assert_equal 1, widget.modifications.length
    widget.update_attributes(:name => 'Bugle')
    assert_equal 2, widget.modifications.length
  end

  test 'destroy with plain model class' do
    widget = Widget.create
    assert_equal 1, widget.modifications.length
    widget.destroy
    versions_for_widget = PaperTrail::Modification.with_item_keys('Widget', widget.id)
    assert_equal 2, versions_for_widget.length
  end
end
