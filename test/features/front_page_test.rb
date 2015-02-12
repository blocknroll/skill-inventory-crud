require_relative '../test_helper'

class FrontPageTest < FeatureTest

  def test_user_sees_greeting
    visit '/'
    assert page.has_content?("Manage Your Skills.")
  end

  def test_user_sees_greeting_on_front_page
    visit '/'
    within('#greeting') do
      assert page.has_content?("Manage Your Skills.")
    end
  end

  def test_user_sees_index_and_new_links
    visit '/'
    within ('nav') do
      assert page.has_link?('Skill Index')
      assert page.has_link?('New Skill')
    end
  end
end
