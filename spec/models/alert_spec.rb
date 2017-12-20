require 'rails_helper'

RSpec.describe Alert, type: :model do
  it { should validate_uniqueness_of(:reference_id) }
  it { should validate_presence_of(:reference_id) }
  it { should validate_presence_of(:delay) }
  it { should validate_presence_of(:description) }
end
