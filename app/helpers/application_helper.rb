module ApplicationHelper

  def curren_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def welcome_message
    if logged_in?
      "Welcome #{ current_user.name } Guru"
    end
  end

  def signout
    link_to 'Signout', signout_path
  end

  def login
    link_to 'Login', login_path
  end

  def signup
    link_to 'Signup', signup_path
  end

end
