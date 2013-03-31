require 'test_helper'

class ModificationTest < ActiveSupport::TestCase
  setup {
    change_schema
    @article = Animal.create
    assert PaperTrail::Modification.creates.present?
  }

  context "PaperTrail::Modification.creates" do
    should "return only create events" do
      PaperTrail::Modification.creates.each do |version|
        assert_equal "create", version.event
      end
    end
  end

  context "PaperTrail::Modification.updates" do
    setup {
      @article.update_attributes(:name => 'Animal')
      assert PaperTrail::Modification.updates.present?
    }

    should "return only update events" do
      PaperTrail::Modification.updates.each do |version|
        assert_equal "update", version.event
      end
    end
  end

  context "PaperTrail::Modification.destroys" do
    setup {
      @article.destroy
      assert PaperTrail::Modification.destroys.present?
    }

    should "return only destroy events" do
      PaperTrail::Modification.destroys.each do |version|
        assert_equal "destroy", version.event
      end
    end
  end
end
