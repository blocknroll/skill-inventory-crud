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

  def test_it_can_find_the_task_by_id
    TaskManager.create({ :title => "go shopping", :description => "eggs, milk, butter"})
    TaskManager.create({ :title => "school", :description => "write tests"})
    TaskManager.create({ :title => "exercise", :description => "swim"})

    task = TaskManager.find(3)
    assert_equal "exercise", task.title
    assert_equal "swim", task.description
    assert_equal 3, task.id
  end

end
