require_relative '../lib/string'

describe String do
  describe '#is_lower?' do

    context 'when string is lower case' do
      subject(:lower_string) { described_class.new(test_string) }
      let(:test_string) { 'q' }


      it 'returns true' do
        result = lower_string.is_lower?
        expect(result).to be(true)
      end

    subject(:long_string) { described_class.new(test_longer_string) }
      let(:test_longer_string) { 'queen' }

      it 'returns true' do
        result = long_string.is_lower?
        expect(result).to be(true)
      end
    end

    context 'when string is upper case' do

      subject(:upper_string) { described_class.new(test_upper) }
      let(:test_upper) { 'Q' }

      it 'returns false' do
        result = upper_string.is_lower?
        expect(result).to be(false)
      end
    end

    context 'when string is mixed  case' do

      subject(:long_string_wih_mixcase) { described_class.new(long_string_mixcase) }
      let(:long_string_mixcase) { 'quEen' }

      it 'returns false' do
        result = long_string_wih_mixcase.is_lower?
        expect(result).to be(false)
      end
    end
  end

  describe '#is_upper?' do
    context 'when string is lower case' do
      subject(:lower_string) { described_class.new(test_string) }
      let(:test_string) { 'q' }


      it 'returns false' do
        result = lower_string.is_upper?
        expect(result).to be(false)
      end

    subject(:long_string) { described_class.new(test_longer_string) }
      let(:test_longer_string) { 'queen' }

      it 'returns false' do
        result = long_string.is_upper?
        expect(result).to be(false)
      end
    end

    context 'when string is upper case' do

      subject(:upper_string) { described_class.new(test_upper) }
      let(:test_upper) { 'Q' }

      it 'returns true' do
        result = upper_string.is_upper?
        expect(result).to be(true)
      end

      subject(:long_string) { described_class.new(test_longer_string) }
      let(:test_longer_string) { 'QUEEN' }

      it 'returns false' do
        result = long_string.is_upper?
        expect(result).to be(true)
      end
    end

    context 'when string is mixed  case' do

      subject(:long_string_wih_mixcase) { described_class.new(long_string_mixcase) }
      let(:long_string_mixcase) { 'quEen' }

      it 'returns false' do
        result = long_string_wih_mixcase.is_upper?
        expect(result).to be(false)
      end
    end
  end
end
