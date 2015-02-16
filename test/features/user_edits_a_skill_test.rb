require_relative '../test_helper'

class UserEditsSkillTest < FeatureTest

  def test_user_edits_a_skill

    SkillInventory.create({ :name   => "original name",
                            :status => "original status" })

    visit '/skills/1/edit'
    fill_in 'skill[name]',   with: "updated name"
    fill_in 'skill[status]', with: 'updated status'
    click_link_or_button("update skill")

    assert_equal '/skills/1', current_path

    within('#name') do
      assert page.has_content?("updated name")
    end
    within('#status') do
      assert page.has_content?("updated status")
    end

  end

end
