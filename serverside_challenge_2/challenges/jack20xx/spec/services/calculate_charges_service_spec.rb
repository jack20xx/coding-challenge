require 'rails_helper'

RSpec.describe CalculateChargesService do
  describe 'calculate_charges method' do
    context 'when parameters are correct' do
      it 'should return correct properties' do
        @service = CalculateChargesService.new(50, 500)
        charges = @service.calculate_charges
        expect(charges.first).to include(:provider_name, :plan_name, :price)
      end

      it 'should calculate charges correctly' do
        @service = CalculateChargesService.new(50, 500)
        charges = @service.calculate_charges
        expect(charges.first[:price]).to be_a(Numeric)
      end

      it 'should return no_data when amps are unmatched with data' do
        @service = CalculateChargesService.new(0, 500)
        charges = @service.calculate_charges
        expect(charges.first[:price]).to be_a(String)
        expect(charges.first[:price]).to eq('no_data')
      end
    end
  end
end