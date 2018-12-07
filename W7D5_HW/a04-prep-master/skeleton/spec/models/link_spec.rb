require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it 'should validate that :user cannot be empty/falsy' do
    should validate_presence_of(:user).with_message(/must exist|can't be blank/)
  end
  it { should belong_to(:user).class_name(:User) }
  it { should have_many(:comments).class_name(:Comment) }
end
