require_relative '../lib/game_pieces'

describe GamePiece do
  describe '.for' do

    context 'when method calls return correct game piece' do
      subject(:new_game) { described_class }

      it 'returns white rook when count is 1' do
        returned_object = new_game.for(1)
        expect(returned_object).to be_an_instance_of(Rook)
      end

      it 'returns white knight when count is 2' do
        returned_object = new_game.for(2)
        expect(returned_object).to be_an_instance_of(Knight)
      end

      it 'returns white bishop when count is 3' do
        returned_object = new_game.for(3)
        expect(returned_object).to be_an_instance_of(Bishop)
      end

      it 'returns white queen when count is 4' do
        returned_object = new_game.for(4)
        expect(returned_object).to be_an_instance_of(Queen)
      end

      it 'returns white king when count is 5' do
        returned_object = new_game.for(5)
        expect(returned_object).to be_an_instance_of(King)
      end

      it 'returns white bishop when count is 6' do
        returned_object = new_game.for(6)
        expect(returned_object).to be_an_instance_of(Bishop)
      end

      it 'returns white knight when count is 7' do
        returned_object = new_game.for(7)
        expect(returned_object).to be_an_instance_of(Knight)
      end

      it 'returns white rook when count is 8' do
        returned_object = new_game.for(8)
        expect(returned_object).to be_an_instance_of(Rook)
      end

      it 'returns a white pawn when count is 9' do
        returned_object = new_game.for(9)
        expect(returned_object).to be_an_instance_of(Pawn)
      end

      it 'returns a white pawn when count is 12' do
        returned_object = new_game.for(12)
        expect(returned_object).to be_an_instance_of(Pawn)
      end

      it 'returns a white pawn when count is 16' do
        returned_object = new_game.for(16)
        expect(returned_object).to be_an_instance_of(Pawn)
      end

      it 'returns black rook when count is 17' do
        returned_object = new_game.for(17)
        expect(returned_object).to be_an_instance_of(BlackRook)
      end
      
      it 'returns black knight when count is 18' do
        returned_object = new_game.for(18)
        expect(returned_object).to be_an_instance_of(BlackKnight)
      end
      
      it 'returns black bishop when count is 19' do
        returned_object = new_game.for(19)
        expect(returned_object).to be_an_instance_of(BlackBishop)
      end
      
      it 'returns black queen when count is 20' do
        returned_object = new_game.for(20)
        expect(returned_object).to be_an_instance_of(BlackQueen)
      end
      
      it 'returns black king when count is 21' do
        returned_object = new_game.for(21)
        expect(returned_object).to be_an_instance_of(BlackKing)
      end
      
      it 'returns black bishop when count is 22' do
        returned_object = new_game.for(22)
        expect(returned_object).to be_an_instance_of(BlackBishop)
      end
      
      it 'returns black knight when count is 23' do
        returned_object = new_game.for(23)
        expect(returned_object).to be_an_instance_of(BlackKnight)
      end
      
      it 'returns black rook when count is 24' do
        returned_object = new_game.for(24)
        expect(returned_object).to be_an_instance_of(BlackRook)
      end

      it 'returns a black pawn when count is 25' do
        returned_object = new_game.for(25)
        expect(returned_object).to be_an_instance_of(BlackPawn)
      end

      it 'returns a black pawn when count is 28' do
        returned_object = new_game.for(28)
        expect(returned_object).to be_an_instance_of(BlackPawn)
      end

      it 'returns a black pawn when count is 32' do
        returned_object = new_game.for(32)
        expect(returned_object).to be_an_instance_of(BlackPawn)
      end
    end
  end
end

describe Rook do
  describe "#set_start_location" do

    context 'when first rook is created' do
      subject(:first_rook) { described_class.new(count) }
      let(:count)  { 1 }
      it 'has location of [1, 1]' do
        location = first_rook.set_start_location
        expect(location).to eq([1, 1])
      end
    end

    context 'when second rook is created' do
      subject(:second_rook) { described_class.new(count) }
      let(:count)  { 8 }
      it 'has location of [1, 8]' do
        location = second_rook.set_start_location
        expect(location).to eq([1, 8])
      end
    end
  end
end

describe Knight do
  describe "#set_start_location" do

    context 'when first knight is created' do
      subject(:first_knight) { described_class.new(count) }
      let(:count)  { 2 }
      it 'has location of [1, 2]' do
        location = first_knight.set_start_location
        expect(location).to eq([1, 2])
      end
    end

    context 'when second knight is created' do
      subject(:second_knight) { described_class.new(count) }
      let(:count)  { 7 }
      it 'has location of [1, 7]' do
        location = second_knight.set_start_location
        expect(location).to eq([1, 7])
      end
    end
  end
end

describe Bishop do
  describe "#set_start_location" do

    context 'when first bishop is created' do
      subject(:first_bishop) { described_class.new(count) }
      let(:count)  { 3 }
      it 'has location of [1, 3]' do
        location = first_bishop.set_start_location
        expect(location).to eq([1, 3])
      end
    end

    context 'when second bishop is created' do
      subject(:second_bishop) { described_class.new(count) }
      let(:count)  { 6 }
      it 'has location of [1, 6]' do
        location = second_bishop.set_start_location
        expect(location).to eq([1, 6])
      end
    end
  end
end

describe Queen do
  describe "#set_start_location" do

    context 'when white queen is created' do
      subject(:white_queen) { described_class.new(count) }
      let(:count)  { 4 }
      it 'has location of [1, 4]' do
        location = white_queen.set_start_location
        expect(location).to eq([1, 4])
      end
    end
  end
end

describe King do
  describe "#set_start_location" do

    context 'when white king is created' do
      subject(:white_king) { described_class.new(count) }
      let(:count)  { 5 }
      it 'has location of [1, 5]' do
        location = white_king.set_start_location
        expect(location).to eq([1, 5])
      end
    end
  end
end

describe Pawn do
  describe "#set_start_location" do

    context 'when first white pawn is created' do
      subject(:first_pawn) { described_class.new(count) }
      let(:count)  { 9 }
      it 'has location of [2, 1]' do
        location = first_pawn.set_start_location
        expect(location).to eq([2, 1])
      end
    end

    context 'when second white pawn is created' do
      subject(:second_pawn) { described_class.new(count) }
      let(:count)  { 10 }
      it 'has location of [2, 2]' do
        location = second_pawn.set_start_location
        expect(location).to eq([2, 2])
      end
    end

    context 'when third white pawn is created' do
      subject(:third_pawn) { described_class.new(count) }
      let(:count)  { 11 }
      it 'has location of [2, 3]' do
        location = third_pawn.set_start_location
        expect(location).to eq([2, 3])
      end
    end

    context 'when fourth white pawn is created' do
      subject(:fourth_pawn) { described_class.new(count) }
      let(:count)  { 12 }
      it 'has location of [2, 4]' do
        location = fourth_pawn.set_start_location
        expect(location).to eq([2, 4])
      end
    end

    context 'when fifth white pawn is created' do
      subject(:fifth_pawn) { described_class.new(count) }
      let(:count)  { 13 }
      it 'has location of [2, 5]' do
        location = fifth_pawn.set_start_location
        expect(location).to eq([2, 5])
      end
    end

    context 'when sixth white pawn is created' do
      subject(:sixth_pawn) { described_class.new(count) }
      let(:count)  { 14 }
      it 'has location of [2, 6]' do
        location = sixth_pawn.set_start_location
        expect(location).to eq([2, 6])
      end
    end

    context 'when seventh white pawn is created' do
      subject(:seventh_pawn) { described_class.new(count) }
      let(:count)  { 15 }
      it 'has location of [2, 7]' do
        location = seventh_pawn.set_start_location
        expect(location).to eq([2, 7])
      end
    end

    context 'when eight white pawn is created' do
      subject(:eight_pawn) { described_class.new(count) }
      let(:count)  { 16 }
      it 'has location of [2, 8]' do
        location = eight_pawn.set_start_location
        expect(location).to eq([2, 8])
      end
    end
  end
end

describe BlackRook do
  describe "#set_start_location" do

    context 'when first black rook is created' do
      subject(:first_rook) { described_class.new(count) }
      let(:count)  { 17 }
      it 'has location of [8, 1]' do
        location = first_rook.set_start_location
        expect(location).to eq([8, 1])
      end
    end

    context 'when second rook is created' do
      subject(:second_rook) { described_class.new(count) }
      let(:count)  { 24 }
      it 'has location of [8, 8]' do
        location = second_rook.set_start_location
        expect(location).to eq([8, 8])
      end
    end
  end
end

describe BlackKnight do
  describe "#set_start_location" do

    context 'when first black knight is created' do
      subject(:first_knight) { described_class.new(count) }
      let(:count)  { 18 }
      it 'has location of [8, 2]' do
        location = first_knight.set_start_location
        expect(location).to eq([8, 2])
      end
    end

    context 'when second black knight is created' do
      subject(:second_knight) { described_class.new(count) }
      let(:count)  { 23 }
      it 'has location of [8, 7]' do
        location = second_knight.set_start_location
        expect(location).to eq([8, 7])
      end
    end
  end
end

describe BlackBishop do
  describe "#set_start_location" do

    context 'when first black bishop is created' do
      subject(:first_bishop) { described_class.new(count) }
      let(:count)  { 19 }
      it 'has location of [8, 3]' do
        location = first_bishop.set_start_location
        expect(location).to eq([8, 3])
      end
    end

    context 'when second black bishop is created' do
      subject(:second_bishop) { described_class.new(count) }
      let(:count)  { 22 }
      it 'has location of [8, 6]' do
        location = second_bishop.set_start_location
        expect(location).to eq([8, 6])
      end
    end
  end
end

describe BlackQueen do
  describe "#set_start_location" do

    context 'when black queen is created' do
      subject(:black_queen) { described_class.new(count) }
      let(:count)  { 21 }
      it 'has location of [8, 4]' do
        location = black_queen.set_start_location
        expect(location).to eq([8, 4])
      end
    end
  end
end

describe BlackKing do
  describe "#set_start_location" do

    context 'when black king is created' do
      subject(:black_king) { described_class.new(count) }
      let(:count)  { 21 }
      it 'has location of [8, 5]' do
        location = black_king.set_start_location
        expect(location).to eq([8, 5])
      end
    end
  end
end

describe Pawn do
  describe "#set_start_location" do

    context 'when first white pawn is created' do
      subject(:first_pawn) { described_class.new(count) }
      let(:count)  { 9 }
      it 'has location of [2, 1]' do
        location = first_pawn.set_start_location
        expect(location).to eq([2, 1])
      end
    end

    context 'when second white pawn is created' do
      subject(:second_pawn) { described_class.new(count) }
      let(:count)  { 10 }
      it 'has location of [2, 2]' do
        location = second_pawn.set_start_location
        expect(location).to eq([2, 2])
      end
    end

    context 'when third white pawn is created' do
      subject(:third_pawn) { described_class.new(count) }
      let(:count)  { 11 }
      it 'has location of [2, 3]' do
        location = third_pawn.set_start_location
        expect(location).to eq([2, 3])
      end
    end

    context 'when fourth white pawn is created' do
      subject(:fourth_pawn) { described_class.new(count) }
      let(:count)  { 12 }
      it 'has location of [2, 4]' do
        location = fourth_pawn.set_start_location
        expect(location).to eq([2, 4])
      end
    end

    context 'when fifth white pawn is created' do
      subject(:fifth_pawn) { described_class.new(count) }
      let(:count)  { 13 }
      it 'has location of [2, 5]' do
        location = fifth_pawn.set_start_location
        expect(location).to eq([2, 5])
      end
    end

    context 'when sixth white pawn is created' do
      subject(:sixth_pawn) { described_class.new(count) }
      let(:count)  { 14 }
      it 'has location of [2, 6]' do
        location = sixth_pawn.set_start_location
        expect(location).to eq([2, 6])
      end
    end

    context 'when seventh white pawn is created' do
      subject(:seventh_pawn) { described_class.new(count) }
      let(:count)  { 15 }
      it 'has location of [2, 7]' do
        location = seventh_pawn.set_start_location
        expect(location).to eq([2, 7])
      end
    end

    context 'when eight white pawn is created' do
      subject(:eight_pawn) { described_class.new(count) }
      let(:count)  { 16 }
      it 'has location of [2, 8]' do
        location = eight_pawn.set_start_location
        expect(location).to eq([2, 8])
      end
    end
  end
end