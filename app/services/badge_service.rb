class BadgeService
  delegate :test_passage, to: :BadgeObject

  class BadgeObject
    def initialize(badge)
      @badge = badge
    end

  end

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    @badges_box = []
    badges = Badge.all

    badges.each do |badge_one|
      badge_obj = BadgeObject.new(badge_one)

      send(badge_one.rule_type.to_sym, badge_obj, *badge_one.param)
      @badges_box << badge_one
    end
    @badges_box
  end

  private

  def user_tests(badge_obj)
    badge_obj.test_passage.user.tests.distinct
  end

  def for_category(badge_obj, category)
    badge_obj.badge if user_tests(badge_obj).where(category: category).count == Test.where(category: category).count
  end

  def for_level(badge_obj, level)
    badge_obj.badge if user_tests(badge_obj).where(level: level).count == Test.where(level: level.to_i).count
  end

  def first_attempt(badge_obj)
    badge_obj.badge if badge_obj.test_passage.unique?
  end
end
