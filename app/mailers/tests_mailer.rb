class TestsMailer < ApplicationMailer

  def completed_test(test_passage)
    @user = test_passage.user
    @test = test_passage.test

    mail to: @user.email, from: %{ "TestGuru" <glexx909@gmail.com> }
  end

end
