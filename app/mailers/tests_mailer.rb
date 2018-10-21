class TestsMailer < ApplicationMailer

  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail from: %{ "TestGuru" <glexx909@gmail.com> }, to: @user.email
  end

end
