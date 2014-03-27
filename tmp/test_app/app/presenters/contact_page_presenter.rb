require 'active_model'

class ContactPagePresenter
  include ActiveModel::Model

  attr_accessor(
    :email,
    :subject,
    :message
  )

  validates :subject, presence: true
  validates :email, presence: true

  def attributes
    {
      email: email,
      subject: subject,
      message: message,
    }
  end
end
