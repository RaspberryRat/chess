require_relative '../lib/board'
require_relative '../lib/piece_module'

describe Board do
  describe '#print_board' do
    context 'when board is empty' do

      subject(:empty_board) { described_class.new(clear_board) }
      let(:clear_board) { '8/8/8/8/8/8/8/8' }


      empty_row_green = "#{GREEN_SQUARE}   #{WHITE_SQUARE}   " * 4 + "\u001b[0m\n"
      empty_row_white = "#{WHITE_SQUARE}   #{GREEN_SQUARE}   " * 4 + "\u001b[0m\n"
      printed_board = "8 #{empty_row_green}"\
                      "7 #{empty_row_white}"\
                      "6 #{empty_row_green}"\
                      "5 #{empty_row_white}"\
                      "4 #{empty_row_green}"\
                      "3 #{empty_row_white}"\
                      "2 #{empty_row_green}"\
                      "1 #{empty_row_white}"\
                      "   A  B  C  D  E  F  G  H"\
                      "\n"
      it 'prints empty board' do
        expect(empty_board).to receive(:print).with(printed_board)
        empty_board.print_board
      end
    end

    context 'when new game' do

      subject(:new_game) { described_class.new(starting_board) }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }


      empty_row_green = "#{GREEN_SQUARE}   #{WHITE_SQUARE}   " * 4 + "\u001b[0m\n"
      empty_row_white = "#{WHITE_SQUARE}   #{GREEN_SQUARE}   " * 4 + "\u001b[0m\n"
      printed_board = 
      "8 "\
      "#{GREEN_SQUARE} #{BLACK_ROOK} "\
      "#{WHITE_SQUARE} #{BLACK_KNIGHT} "\
      "#{GREEN_SQUARE} #{BLACK_BISHOP} "\
      "#{WHITE_SQUARE} #{BLACK_QUEEN} "\
      "#{GREEN_SQUARE} #{BLACK_KING} "\
      "#{WHITE_SQUARE} #{BLACK_BISHOP} "\
      "#{GREEN_SQUARE} #{BLACK_KNIGHT} "\
      "#{WHITE_SQUARE} #{BLACK_ROOK} #{NEW_LINE}"\
      "7 "\
      "#{WHITE_SQUARE} #{BLACK_PAWN} #{GREEN_SQUARE} #{BLACK_PAWN} "\
      "#{WHITE_SQUARE} #{BLACK_PAWN} #{GREEN_SQUARE} #{BLACK_PAWN} "\
      "#{WHITE_SQUARE} #{BLACK_PAWN} #{GREEN_SQUARE} #{BLACK_PAWN} "\
      "#{WHITE_SQUARE} #{BLACK_PAWN} #{GREEN_SQUARE} #{BLACK_PAWN} "\
      "#{NEW_LINE}"\
      "6 #{empty_row_green}"\
      "5 #{empty_row_white}"\
      "4 #{empty_row_green}"\
      "3 #{empty_row_white}"\
      "2 "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{NEW_LINE}"\
      "1 "\
      "#{WHITE_SQUARE} #{WHITE_ROOK} "\
      "#{GREEN_SQUARE} #{WHITE_KNIGHT} "\
      "#{WHITE_SQUARE} #{WHITE_BISHOP} "\
      "#{GREEN_SQUARE} #{WHITE_QUEEN} "\
      "#{WHITE_SQUARE} #{WHITE_KING} "\
      "#{GREEN_SQUARE} #{WHITE_BISHOP} "\
      "#{WHITE_SQUARE} #{WHITE_KNIGHT} "\
      "#{GREEN_SQUARE} #{WHITE_ROOK} "\
      "#{NEW_LINE}"\
      "   A  B  C  D  E  F  G  H"\
      "\n"

      it 'prints starting board for standard chess' do
        expect(new_game).to receive(:print).with(printed_board)
        new_game.print_board
      end
    end

    context 'when white pawn moved to e4' do

      subject(:first_move) { described_class.new(pawn_e4) }
      let(:pawn_e4) { 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR' }


      empty_row_green = "#{GREEN_SQUARE}   #{WHITE_SQUARE}   " * 4 + "\u001b[0m\n"
      empty_row_white = "#{WHITE_SQUARE}   #{GREEN_SQUARE}   " * 4 + "\u001b[0m\n"
      printed_board = 
      "8 "\
      "#{GREEN_SQUARE} #{BLACK_ROOK} "\
      "#{WHITE_SQUARE} #{BLACK_KNIGHT} "\
      "#{GREEN_SQUARE} #{BLACK_BISHOP} "\
      "#{WHITE_SQUARE} #{BLACK_QUEEN} "\
      "#{GREEN_SQUARE} #{BLACK_KING} "\
      "#{WHITE_SQUARE} #{BLACK_BISHOP} "\
      "#{GREEN_SQUARE} #{BLACK_KNIGHT} "\
      "#{WHITE_SQUARE} #{BLACK_ROOK} #{NEW_LINE}"\
      "7 "\
      "#{WHITE_SQUARE} #{BLACK_PAWN} #{GREEN_SQUARE} #{BLACK_PAWN} "\
      "#{WHITE_SQUARE} #{BLACK_PAWN} #{GREEN_SQUARE} #{BLACK_PAWN} "\
      "#{WHITE_SQUARE} #{BLACK_PAWN} #{GREEN_SQUARE} #{BLACK_PAWN} "\
      "#{WHITE_SQUARE} #{BLACK_PAWN} #{GREEN_SQUARE} #{BLACK_PAWN} "\
      "#{NEW_LINE}"\
      "6 #{empty_row_green}"\
      "5 #{empty_row_white}"\
      "4 #{GREEN_SQUARE} #{EMPTY_SPACE}#{WHITE_SQUARE} #{EMPTY_SPACE}"\
      "#{GREEN_SQUARE} #{EMPTY_SPACE}#{WHITE_SQUARE} #{EMPTY_SPACE}"\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{EMPTY_SPACE}"\
      "#{GREEN_SQUARE} #{EMPTY_SPACE}#{WHITE_SQUARE} #{EMPTY_SPACE}"\
      "#{NEW_LINE}"\
      "3 #{empty_row_white}"\
      "2 "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{GREEN_SQUARE} #{EMPTY_SPACE}#{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{GREEN_SQUARE} #{WHITE_PAWN} #{WHITE_SQUARE} #{WHITE_PAWN} "\
      "#{NEW_LINE}"\
      "1 "\
      "#{WHITE_SQUARE} #{WHITE_ROOK} "\
      "#{GREEN_SQUARE} #{WHITE_KNIGHT} "\
      "#{WHITE_SQUARE} #{WHITE_BISHOP} "\
      "#{GREEN_SQUARE} #{WHITE_QUEEN} "\
      "#{WHITE_SQUARE} #{WHITE_KING} "\
      "#{GREEN_SQUARE} #{WHITE_BISHOP} "\
      "#{WHITE_SQUARE} #{WHITE_KNIGHT} "\
      "#{GREEN_SQUARE} #{WHITE_ROOK} "\
      "#{NEW_LINE}"\
      "   A  B  C  D  E  F  G  H"\
      "\n"

      it 'prints starting board for standard chess' do
        expect(first_move).to receive(:print).with(printed_board)
        first_move.print_board
      end
    end
  end

  describe '#piece_at_location?' do
    context 'when a piece is at selected square' do
      subject(:select_square) { described_class.new }
      let(:square_picked) { 'b1' }

      before do
        allow(select_square).to receive(:what_piece).and_return('p')
      end

      it 'returns true' do
        result = select_square.piece_at_location?(square_picked)
        expect(result).to be(true)
      end
    end

    context 'when there is no piece at selected square' do
      subject(:select_square) { described_class.new }
      let(:square_picked) { 'b3' }

      before do
        allow(select_square).to receive(:what_piece).and_return(nil)
      end

      it 'returns false' do
        result = select_square.piece_at_location?(square_picked)
        expect(result).to be(false)
      end
    end
  end

  describe '#what_piece?' do
    context 'when a square selected' do

      subject(:pawn_selected) { described_class.new }
      let(:pawn_location) { 'b2' }

      it "returns 'P' for a pawn" do
        result = pawn_selected.what_piece(pawn_location)
        expect(result).to eq('P')
      end


    subject(:first_move) { described_class.new(pawn_e4) }
    let(:pawn_e4) { 'rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR' }
    let(:pawn_moved) { 'e4'}
    it "returns 'P' for a pawn" do
      result = first_move.what_piece(pawn_moved)
      expect(result).to eq('P')
    end
  end

  context 'when almost empty board and black king selected at c4' do

    subject(:end_game_board) { described_class.new(end_board) }
    let(:end_board) { '8/8/8/4p1K1/2k1P3/8/8/8' }
    let(:square_picked) { 'c4' }

    it "returns 'K'" do
      result = end_game_board.what_piece(square_picked)
      expect(result).to eq('k')
    end

    it "returns 'empty square' when pick 'c3'" do
      result = end_game_board.what_piece('c3')
      expect(result).to eq('empty square')
    end
  end
    
    context 'when an empty square selected' do

      subject(:empty_square_check) { described_class.new }
      let(:empty_location) { 'b4' }

      it "returns 'empty square'" do
        result = empty_square_check.what_piece(empty_location)
        expect(result).to eq('empty square')
      end
    end
  end

  describe '#allowed_move?' do
    context 'when a move is chosen, check if legal move' do
      subject(:pawn_move) { described_class.new(starting_board, game_pieces) }
      let(:pawn) { 'b2' }
      let(:move) { 'b3' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }
      let(:game_pieces) { double('game_pieces') }

      before do
        allow(game_pieces).to receive(:moves).and_return('[1, 1], [1, 2]')
        allow(pawn_move).to receive(:move_checker?).and_return(true)
      end


      it 'returns true' do
        result = pawn_move.allowed_move?(pawn, move)
        expect(result).to be(true)

      end
    end
      
    context 'when a move is chosen, check if legal move' do
      subject(:illegal_pawn_move) { described_class.new(starting_board, game_pieces) }
      let(:pawn) { 'b2' }
      let(:move) { 'b7' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }
      let(:game_pieces) { double('game_pieces') }
  
      before do
        allow(game_pieces).to receive(:moves).and_return('[0, 1], [0, 2]')
        allow(illegal_pawn_move).to receive(:move_checker?).and_return(false)
      end
  
      it 'returns false' do
        result = illegal_pawn_move.allowed_move?(pawn, move)
        expect(result).to be(false)
      end
    end
  end

  describe '#move_checker?' do
    context 'when a move is allowed' do

      subject(:pawn_move) { described_class.new(starting_board, game_pieces) }
      let(:pawn) { 'b2' }
      let(:move) { 'b3' }
      let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }
      let(:game_pieces) { double('game_pieces') }
      let(:move_list) { [[0, 1], [0, 2]] }

      it 'returns true' do
        result = pawn_move.move_checker?(pawn, move, move_list)
        expect(result).to be(true)
      end
    end
  end 

  # TODO write convert to grid method, then game_pieces move lists

  # describe '#move_piece' do
  #   context 'when pawn h2 is selected' do
  #     subject(:move_white_pawn) { described_class.new(starting_positions) }
  #     let(:starting_positions) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }

  #     let(:updated_positions) { 'rnbqkbnr/pppppppp/8/8/8/7P/PPPPPPP1/RNBQKBNR' }
  #     let(:move) { double('move', start_position: 'h1', new_position: 'h3') }


  #     it 'updates board with new field layout' do
  #       new_position = move_white_pawn.move_piece(move)
  #       expect(new_position).to eq(updated_positions)

  #     end
  #   end
  # end
end

