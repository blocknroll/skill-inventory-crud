require_relative '../test_helper'

class UserCreatesSkillTest < FeatureTest

  def test_user_creates_a_skill
    visit '/'
    click_link_or_button('New Skill')
    assert_equal '/skills/new', current_path
    fill_in 'skill[name]', with: "eating"
    fill_in 'skill[status]', with: 'good'
    click_link_or_button("add skill")
    assert_equal '/skills', current_path
    within('.skill_panel') do
      assert page.has_content?("eating")
    end
    click_link_or_button("eating")
    assert_equal '/skills/1', current_path
    assert page.has_content?("good")
  end

end
