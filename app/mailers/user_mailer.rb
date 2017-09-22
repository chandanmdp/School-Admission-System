class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @candidate = candidate
    mail(to: @user.email, subject: "Application Successful")
  end

  def selection_email(user, candidate)
    @user = user
    @candidate = candidate
    mail(to: @user.email, subject: "Admission Status")
  end

  def rejection_email(user, candidate)
    @user = user
    @candidate = candidate
    mail(to: @user.email, subject: "Admission status")
  end
end
