require 'rails_helper'

RSpec.describe Stock, type: :model do
  it { should validate_presence_of(:symbol) }
  it { should validate_presence_of(:function) }
  it { should validate_presence_of(:data) }
end
