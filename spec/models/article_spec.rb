require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'Validation Presence Tests' do
    it 'Ensures title presence'
    it 'Ensures post presence'
    it 'Ensures author id presence'
    it 'Should save successfully'
  end

  context 'Validation Length Tests' do
    it 'Ensures title character  length, not less than 5'
    it 'Ensures title character length, not more than 30'
    it 'Ensures post character length, not less than 5'
  end

  context 'Data Type Tests' do
    it 'Ensures Author ID is numericality'
  end
end
