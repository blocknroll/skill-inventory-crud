require_relative '../test_helper'

class SkillInventoryTest < ModelTest
  def test_it_creates_a_skill
    SkillInventory.create({ :name   => "a name",
                            :status => "a status"})
    skill = SkillInventory.find(1)
    assert_equal "a name", skill.name
    assert_equal "a status", skill.status
    assert_equal 1, skill.id
  end
end
