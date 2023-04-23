require_relative "../lib/move"

describe Move do
  describe ".move_loop" do
    context "when called" do
      subject(:game_move) { described_class }
      let(:location) { "b1" }
      let(:destination) { "b2" }
      let(:board) { "board" }

      it "create new instance of Move" do
        expect(game_move).to receive(:move_loop)
        game_move.move_loop("b", "b", "b")
      end
    end
  end

  #private methods

  describe "#legal_selection?" do
    context "when a move is legal" do
      subject(:legal_piece) do
        described_class.new(location, destination, board)
      end
      let(:board) { double("board") }
      let(:location) { "a4" }
      let(:destination) { "b2" }

      before do
        allow(legal_piece).to receive(:piece_at_location?).and_return(true)
      end

      xit "returns true" do
        result = legal_piece.legal_selection?
        expect(result).to be(true)
      end
    end

    context "when there is no piece at the location" do
      subject(:illegal_selection) do
        described_class.new(invalid_input, destination, board)
      end
      let(:board) { double("board") }
      let(:invalid_input) { "e4" }
      let(:destination) { "b2" }

      before do
        allow(illegal_selection).to receive(:piece_at_location?).and_return(
          false
        )
      end

      xit "puts error message" do
        error_message = "There is no piece at location 'e4'."
        expect(illegal_selection).to receive(:puts).with(error_message)
        illegal_selection.legal_selection?
      end

      xit "returns false" do
        result = illegal_selection.legal_selection?
        expect(result).to be(false)
        illegal_selection.legal_selection?
      end
    end
  end

  describe "#legal_move?" do
    context "when a square is empty and a move is legal?" do
      subject(:legal_move) { described_class.new(piece, destination, board) }
      let(:board) { double("board") }
      let(:destination) { "b3" }
      let(:piece) { "b2" }

      before { allow(legal_move).to receive(:allowed_move?).and_return(true) }

      xit "returns true for empty square" do
        result = legal_move.legal_move?
        expect(result).to eq(true)
      end
    end

    context "when a illegal square is chosen for a pawn move" do
      subject(:illegal_move) { described_class.new(piece, destination, board) }
      let(:board) { double("board") }
      let(:destination) { "b1" }
      let(:piece) { "b2" }

      before do
        allow(illegal_move).to receive(:allowed_move?).and_return(false)
        allow(illegal_move).to receive(:allowed_move?).and_return(false, true)
      end

      xit "returns error message" do
        error_message =
          "That is not a legal move, please choose a different destination."
        expect(illegal_move).to receive(:puts).with(error_message).once
        illegal_move.legal_move?
      end
    end
  end

  describe "#piece_at_location?" do
    context "when a piece is at selected square" do
      subject(:select_square) do
        described_class.new(square_picked, destination, board)
      end
      let(:square_picked) { "b1" }
      let(:board) { double("board") }
      let(:destination) { "b1" }

      before { allow(select_square).to receive(:what_piece).and_return("p") }

      xit "returns true" do
        result = select_square.piece_at_location?
        expect(result).to be(true)
      end
    end

    context "when there is no piece at selected square" do
      subject(:select_square) do
        described_class.new(square_picked, destination, board)
      end
      let(:square_picked) { "b3" }
      let(:board) { double("board") }
      let(:destination) { "b1" }

      before { allow(select_square).to receive(:what_piece).and_return(false) }

      xit "returns false" do
        result = select_square.piece_at_location?
        expect(result).to be(false)
      end
    end
  end

  # private methods
  describe "#allowed_move?" do
    context "when a move is chosen, check if legal move" do
      subject(:pawn_move) do
        described_class.new(pawn, destination, starting_board, game_pieces)
      end
      let(:pawn) { "b2" }
      let(:destination) { "b3" }
      let(:starting_board) { "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR" }
      let(:game_pieces) { double("game_pieces") }

      before do
        allow(game_pieces).to receive(:moves).and_return("[1, 1], [1, 2]")
        allow(pawn_move).to receive(:move_checker?).and_return(true)
      end

      xit "returns true" do
        result = pawn_move.allowed_move?
        expect(result).to be(true)
      end
    end

    context "when a move is chosen, check if legal move" do
      subject(:illegal_pawn_move) do
        described_class.new(pawn, destination, starting_board, game_pieces)
      end
      let(:pawn) { "b2" }
      let(:destination) { "b7" }
      let(:starting_board) { "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR" }
      let(:game_pieces) { double("game_pieces") }

      before do
        allow(game_pieces).to receive(:moves).and_return("[0, 1], [0, 2]")
        allow(illegal_pawn_move).to receive(:move_checker?).and_return(false)
      end

      xit "returns false" do
        result = illegal_pawn_move.allowed_move?
        expect(result).to be(false)
      end
    end
  end

  # # private methods - comment out to test
  # describe '#array_to_fen_notation' do
  #   context 'when given starting locations as board array' do
  #     subject(:new_game) { described_class.new(pawn, pawn2, white_queen_row) }
  #     let(:pawn) { 'a2' }
  #     let(:pawn2) { 'a3' }
  #     let(:white_queen_row) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/3Q4' }

  #     board_array = [[".", ".", ".", "Q", ".", ".", ".", "."],
  #     ["P", "P", "P", "P", "P", "P", "P", "P"],
  #     [".", ".", ".", ".", ".", ".", ".", "."],
  #     [".", ".", ".", ".", ".", ".", ".", "."],
  #     [".", ".", ".", ".", ".", ".", ".", "."],
  #     [".", ".", ".", ".", ".", ".", ".", "."],
  #     ["p", "p", "p", "p", "p", "p", "p", "p"],
  #     ["r", "n", "b", "q", "k", "b", "n", "r"]]

  #     it 'returns starting fen notation' do
  #       fen_notation = new_game.array_to_fen_notation(board_array)
  #       expect(fen_notation).to eq(white_queen_row)
  #     end
  #   end

  #   context 'when given a board array' do
  #     subject(:new_game) { described_class.new(pawn, pawn2, starting_board) }
  #     let(:pawn) { 'a2' }
  #     let(:pawn2) { 'a3' }
  #     let(:starting_board) { 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR' }

  #     board_array = [["R", "N", "B", "Q", "K", "B", "N", "R"],
  #     ["P", "P", "P", "P", "P", "P", "P", "P"],
  #     [".", ".", ".", ".", ".", ".", ".", "."],
  #     [".", ".", ".", ".", ".", ".", ".", "."],
  #     [".", ".", ".", ".", ".", ".", ".", "."],
  #     [".", ".", ".", ".", ".", ".", ".", "."],
  #     ["p", "p", "p", "p", "p", "p", "p", "p"],
  #     ["r", "n", "b", "q", "k", "b", "n", "r"]]

  #     it 'returns correct fen notation' do
  #       fen_notation = new_game.array_to_fen_notation(board_array)
  #       expect(fen_notation).to eq(starting_board)
  #     end
  #   end
  # end
end
