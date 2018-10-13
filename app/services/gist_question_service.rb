class GistQuestionService

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t('clients.git_hub_client.description', title: @test.title),
      public: true,
      files: {
        'test-guru-question.txt'=> {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  private


  def default_client
    Octokit::Client.new(access_token: access_token)
  end

  def access_token
    ENV['ACCESS_TOKEN']
  end
end
