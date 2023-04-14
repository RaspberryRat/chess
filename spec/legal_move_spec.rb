require_relative "../lib/legal_move"

describe LegalMove do
  describe "#piece_colour" do
    context "when a white queen is selected" do
      subject(:game_move) { described_class.new(empty, empty, empty, empty) }
      let(:empty) { "nil" }
      let(:piece) { "Q" }

      it "returns 'white'" do
        colour = game_move.piece_colour(piece)
        expect(colour).to eq("white")
      end
    end

    context "when a white queen is selected" do
      subject(:game_move) { described_class.new(empty, empty, empty, empty) }
      let(:empty) { "nil" }
      let(:piece) { "q" }

      it "returns 'black'" do
        colour = game_move.piece_colour(piece)
        expect(colour).to eq("black")
      end
    end
  end
end

describe MovePawn do
  describe "#piece_to_capture" do
    context "#when a white pawn is selected at starting location" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [1, 3] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, 0], [2, 0]]
      it "returns white pawn start moves" do
        available_moves = pawn_move.piece_to_capture(pawn_moves)
        expect(available_moves).to match_array(expected_moves)
      end
    end

    context "#when a white pawn is selected with a piece to capture" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [1, 2] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. . . p . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, 0], [2, 0], [1, 1]]
      it "returns three white pawn  moves" do
        available_moves = pawn_move.piece_to_capture(pawn_moves)
        expect(available_moves).to match_array(expected_moves)
      end
    end

    context "#when a white pawn is selected with two piece to capture" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [1, 2] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. p . p . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, 0], [2, 0], [1, 1], [1, -1]]
      it "returns white pawn all moves" do
        available_moves = pawn_move.piece_to_capture(pawn_moves)
        expect(available_moves).to match_array(expected_moves)
      end
    end

    context "#when a white pawn is selected with no pieces to capture" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [1, 2] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. P . P . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, 0], [2, 0]]
      it "returns white pawn start moves" do
        available_moves = pawn_move.piece_to_capture(pawn_moves)
        expect(available_moves).to match_array(expected_moves)
      end
    end
  end

  describe "#at_start_location" do
    context "#when a white pawn is selected at starting location" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0]] }
      let(:location) { [1, 3] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, 0], [2, 0]]

      it "returns white pawn start moves" do
        available_moves = pawn_move.at_start_location(pawn_moves)
        expect(available_moves).to match_array(expected_moves)
      end
    end

    context "#when a white pawn is selected at not at start location" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0]] }
      let(:location) { [2, 3] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P . P P P P],
          %w[. . . P . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, 0]]

      it "returns one white pawn move" do
        available_moves = pawn_move.at_start_location(pawn_moves)
        expect(available_moves).to match_array(expected_moves)
      end
    end
  end

  describe "#moves" do
    context "#when a white pawn is selected at starting location" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [1, 3] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, 0], [2, 0]]

      it "returns white pawn start moves" do
        available_moves = pawn_move.moves
        expect(available_moves).to match_array(expected_moves)
      end
    end

    context "#when a white pawn is selected at not at start location" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [2, 3] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P . P P P P],
          %w[. . . P . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, 0]]

      it "returns one white pawn move" do
        available_moves = pawn_move.moves
        expect(available_moves).to match_array(expected_moves)
      end
    end

    context "#when a black pawn is selected at starting location" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[-1, 0], [-2, 0], [1, -1], [1, 1]] }
      let(:location) { [6, 3] }
      let(:piece_type) { "p" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[-1, 0], [-2, 0]]

      it "returns black pawn start moves" do
        available_moves = pawn_move.moves
        expect(available_moves).to match_array(expected_moves)
      end
    end

    context "#when a black pawn is selected at not at start location" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[-1, 0], [-2, 0], [1, -1], [1, 1]] }
      let(:location) { [5, 3] }
      let(:piece_type) { "p" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P . P P P P],
          %w[. . . P . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . p . . . .],
          %w[p p p . p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[-1, 0]]

      it "returns one black pawn move" do
        available_moves = pawn_move.moves
        expect(available_moves).to match_array(expected_moves)
      end
    end

    context "#when a white pawn is selected with a piece to capture" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [1, 2] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. . . p . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, 0], [2, 0], [1, 1]]
      it "returns three white pawn  moves" do
        available_moves = pawn_move.moves
        expect(available_moves).to match_array(expected_moves)
      end
    end

    context "#when a white pawn is selected with two piece to capture" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [1, 2] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. p . p . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, 0], [2, 0], [1, 1], [1, -1]]
      it "returns white pawn all moves" do
        available_moves = pawn_move.moves
        expect(available_moves).to match_array(expected_moves)
      end
    end

    context "#when a white pawn is selected with no pieces to capture" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [1, 2] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. P . P . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, 0], [2, 0]]
      it "returns white pawn start moves" do
        available_moves = pawn_move.moves
        expect(available_moves).to match_array(expected_moves)
      end
    end

    context "#when a white pawn is selected with no moves" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [1, 1] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. P . P . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = []
      it "returns white pawn start moves" do
        available_moves = pawn_move.moves
        expect(available_moves).to match_array(expected_moves)
      end
    end
  end

  describe "#blocked_square" do
    context "#when a white pawn is selected with piece in front moves" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [1, 1] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. P . P . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, -1], [1, 1]]
      it "returns white pawn no moves" do
        available_moves = pawn_move.blocked_square(pawn_moves)
        expect(available_moves).to match_array(expected_moves)
      end
    end

    context "#when a white pawn is selected with opponent piece in front" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [1, 1] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. p . p . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, -1], [1, 1]]
      it "returns white pawn no moves" do
        available_moves = pawn_move.blocked_square(pawn_moves)
        expect(available_moves).to match_array(expected_moves)
      end
    end

    context "#when a white pawn is selected with no piece in way" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [1, 1] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, 0], [2, 0], [1, -1], [1, 1]]
      it "returns white pawn all moves" do
        available_moves = pawn_move.blocked_square(pawn_moves)
        expect(available_moves).to match_array(expected_moves)
      end
    end
    context "#when a white pawn is selected with 2 squares away" do
      subject(:pawn_move) do
        described_class.new(pawn_moves, location, piece_type, board)
      end
      let(:pawn_moves) { [[1, 0], [2, 0], [1, -1], [1, 1]] }
      let(:location) { [1, 1] }
      let(:piece_type) { "P" }
      let(:board) do
        [
          %w[R N B Q K B N R],
          %w[P P P P P P P P],
          %w[. . . . . . . .],
          %w[. p . . . . . .],
          %w[. . . . . . . .],
          %w[. . . . . . . .],
          %w[p p p p p p p p],
          %w[r n b q k b n r]
        ]
      end

      expected_moves = [[1, 0], [1, -1], [1, 1]]
      it "returns white pawn 3 moves" do
        available_moves = pawn_move.blocked_square(pawn_moves)
        expect(available_moves).to match_array(expected_moves)
      end
    end
  end
end
