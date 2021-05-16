require_relative '../../lib/models/cell'
require_relative '../../lib/models/token'

describe Cell do
  let(:empty_cell) { Cell.new }
  let(:cell_with_white_token) { Cell.new(Token.new('white')) }
  let(:cell_with_black_token) { Cell.new(Token.new('black')) }
  let(:white_token) { Token.new('white') }

  describe 'initiaze' do
    it 'cell started with white token' do
      expect(cell_with_white_token.show_cell).to eql('W')
    end

    it 'cell started with black token' do
      expect(cell_with_black_token.show_cell).to eql('B')
    end
  end

  it 'add_token' do
    expect(empty_cell.show_cell).to eql('.')
    empty_cell.add_token('white')
    expect(empty_cell.show_cell).to eql('W')
  end

  describe 'change_token' do
    it 'permit change' do
      cell_with_white_token.change_enable_or_disable
      cell_with_white_token.change_token
      expect(cell_with_white_token.show_cell).to eql('B')
      cell_with_white_token.change_enable_or_disable
      cell_with_white_token.change_token
      expect(cell_with_white_token.show_cell).to eql('W')
    end

    it 'cannot permit change' do
      cell_with_white_token.change_token
      expect(cell_with_white_token.show_cell).to eql('W')
    end
  end

  describe 'enabled mode' do
    it 'check enabled mode' do
      expect(cell_with_white_token.enabled?).to eql(false)
      cell_with_white_token.change_enable_or_disable
      expect(cell_with_white_token.enabled?).to eql(true)
    end
  end

  describe 'show_cell' do
    it 'empty cell' do
      expect(empty_cell.show_cell).to eql('.')
    end

    it 'enable cell' do
      empty_cell.change_enable_or_disable
      expect(empty_cell.show_cell).to eql('0')
    end

    it 'black token inside' do
      expect(cell_with_black_token.show_cell).to eql('B')
    end

    it 'white token inside' do
      expect(cell_with_white_token.show_cell).to eql('W')
    end
  end
end
