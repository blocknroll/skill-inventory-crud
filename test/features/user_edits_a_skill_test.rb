require_relative '../test_helper'

class UserEditsSkillTest < FeatureTest

  def test_user_edits_a_skill
    SkillInventory.create({ :name   => "updated name",
                            :status => "updated status" })

    visit '/skills'
    click_link_or_button('New Skill')
    assert_equal '/skills/new', current_path
    fill_in 'skill[name]', with: "eating"
    fill_in 'skill[status]', with: 'good'
    click_link_or_button("add skill")
    assert_equal '/skills', current_path
    within('a') do
      assert page.has_css?("eating")
    end
  end
  
end
