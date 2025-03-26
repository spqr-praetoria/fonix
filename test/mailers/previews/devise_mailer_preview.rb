class DeviseMailerPreview < ActionMailer::Preview
  def confirmation_instructions
    user = User.new(email: "test@example.com")

    token = "fake-confirmation-token"

    Devise::Mailer.confirmation_instructions(user, token)
  end

  def email_changed
    user = User.new(email: "new@example.com")

    Devise::Mailer.email_changed(user)
  end

  def password_change
    user = User.new(email: "test@example.com")

    Devise::Mailer.password_change(user)
  end


  def reset_password_instructions
    user = User.new(email: "test@example.com")

    token = "fake-reset-token"

    Devise::Mailer.reset_password_instructions(user, token)
  end
end
