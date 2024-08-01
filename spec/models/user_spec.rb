require 'rails_helper'

RSpec.describe User, type: :model do
    context 'validates field using fixtures' do
        let(:user) { create :user }
        it 'username must be valid' do
          expect(user).to be_valid
        end
        it 'username must not be valid' do
          user.password = ""
          expect(user).to_not be_valid
        end      
    end
end
