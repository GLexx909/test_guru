class BadgeService

  def select_the_badges(current_test, user)

    badges = Badge.all
    desired_badges = []

    #For successfully ended all test of certain category
    category = current_test.test.category.title
    if user.tests.distinct.where(category: category).count == Test.where(category: category).count
      desired_badges << badges.find_by_category(category)
    end

    #For successfully ended all test of certain level
    level = current_test.test.level
    if user.tests.distinct.where(level: level).count == Test.where(level: level).count
      desired_badges << badges.find_by_level(level)
    end

    # For successfully ended Test on the first try
    if current_test.unique?
      desired_badges << badges.find(1) # Ну тут я уже не сообразил как иначе. Отдельный параметр(колонку) прописывать для БАДЖА с "особыми" пометками?
    end


    desired_badges
  end

end
