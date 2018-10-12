class Octokit::Client

  def initialize
    @secret = ENV['ACCESS_TOKEN']
  end

end
