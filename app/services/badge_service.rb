class BadgeService

  attr_reader :test_passage

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    @badges_box = []

    Badge.all.select do |badge|

      send(badge.rule_type, badge, *badge.param)
      @badges_box << badge
    end
    @badges_box
  end

  private

  def user_tests
    self.test_passage.user.tests.distinct
  end

  def for_category(badge, category)
    badge if user_tests.where(category: category).count == Test.where(category: category).count
  end

  def for_level(badge, level)
    badge if user_tests.where(level: level).count == Test.where(level: level).count
  end

  def first_attempt(badge) # wrong number of arguments (given 1, expected 2), если указывать параметр _param. Без него работает всё.
    badge if self.test_passage.unique?
  end
end
