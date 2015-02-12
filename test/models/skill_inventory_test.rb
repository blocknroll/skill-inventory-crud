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

  def test_it_can_count_all_skills
    SkillInventory.create({ :name => "eating", :status => "good"})
    SkillInventory.create({ :name => "sleeping", :status => "ok"})
    SkillInventory.create({ :name => "walking dogs", :status => "pretty good"})

    skills = SkillInventory.raw_skills
    all_skills = SkillInventory.all
    assert_equal 3, all_skills.count
  end

  def test_it_can_find_the_skill_by_id
    SkillInventory.create({ :name => "eating", :status => "good" })
    SkillInventory.create({ :name => "sleeping", :status => "ok" })
    SkillInventory.create({ :name => "walking dogs", :status => "pretty good" })

    skill = SkillInventory.find(3)
    assert_equal "walking dogs", skill.name
    assert_equal "pretty good", skill.status
    assert_equal 3, skill.id
  end

  def test_it_can_update_a_skill
    SkillInventory.create({ :name => "eating", :status => "good" })
    SkillInventory.update(1, { :name => "eating food", :status => "good" })

    assert_equal "eating food", SkillInventory.all.first.name
  end

end
