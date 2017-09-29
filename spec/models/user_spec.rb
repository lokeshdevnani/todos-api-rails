require 'rails_helper'

RSpec.describe User, type: :model do
  # Association tests
  # ensure that user model has 1:m relationship with Todo model
  it { should have_many(:todos)}

  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
