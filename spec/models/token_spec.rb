require_relative '../../lib/models/token'

describe Token do
  let(:white_token) { Token.new('white') }
  let(:black_token) { Token.new('black') }

  describe 'initialize' do
    it 'success white token' do
      new_token = Token.new('white')
      expect(new_token.color).to eq(true)
    end

    it 'success black token' do
      new_token = Token.new('black')
      expect(new_token.color).to eq(false)
    end

    it 'Error' do
      expect { Token.new('othercolor') }.to raise_error RuntimeError
    end
  end

  it 'reverse' do
    expect(white_token.white?).to eq(true)
    expect(white_token.black?).to eq(false)
    white_token.reverse
    expect(white_token.black?).to eq(true)
    expect(white_token.white?).to eq(false)
  end

  it 'white?' do
    expect(white_token.white?).to eq(true)
  end

  it 'black?' do
    expect(black_token.black?).to eq(true)
  end
end
