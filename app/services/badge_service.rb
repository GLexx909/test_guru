class BadgeService

  attr_reader :test_passage

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.all.select do |badge|
      send(badge.rule_type, badge.param)
    end
  end

  private

  def user_tests
    self.test_passage.user.tests.distinct
  end

  def can_give_for_category?(category)
    user_tests.where(category: category).count == Test.where(category: category).count
  end

  def can_give_for_level?(level)
    user_tests.where(level: level).count == Test.where(level: level).count
  end

  def can_give_for_first_attempt?(_param)
    TestPassage.where(user: test_passage.user, test: test_passage.test).count <= 1
  end
end
