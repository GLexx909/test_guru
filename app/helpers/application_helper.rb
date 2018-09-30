module ApplicationHelper

  def curren_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def welcome_message
    "Welcome #{ current_user.name } Guru" if logged_in?
  end

end
