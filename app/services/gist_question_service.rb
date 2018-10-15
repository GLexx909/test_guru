class GistQuestionService

  class ResultObject
    delegate :html_url, :id, to: :@client_response

    def initialize(client_response)
      @client_response = client_response
    end

    def success?
      html_url.present?
    end
  end

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    ResultObject.new(response)
  end

  private

  def gist_params
    {
      description: I18n.t('services.git_question_service.description', title: @test.title),
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
