require_relative '../test_helper'

class UserDeletesSkillTest < FeatureTest

  def test_user_deletes_a_skill
    SkillInventory.create({ :name   => "original name",
                            :status => "original status" })
    visit '/skills'
    assert page.has_content?("original name")
    click_link_or_button("delete")
    assert_equal '/skills', current_path
    refute page.has_content?("original name")
  end

end
