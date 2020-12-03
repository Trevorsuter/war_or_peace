class Turn

  attr_reader :player1, :player2, :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []
  end

  def type
    if (player1.deck.rank_of_card_at(0)) == (player2.deck.rank_of_card_at(0)) &&
    (player1.deck.rank_of_card_at(2)) == (player2.deck.rank_of_card_at(2))
      :mutually_assured_destruction
    elsif (player1.deck.rank_of_card_at(0)) == (player2.deck.rank_of_card_at(0))
      :war
    else (player1.deck.rank_of_card_at(0)) != (player2.deck.rank_of_card_at(0))
      :basic
    end
  end

  def winner
    if self.type == :basic && (player1.deck.rank_of_card_at(0)) >
    (player2.deck.rank_of_card_at(0)) || self.type == :war &&
    (player1.deck.rank_of_card_at(2)) > (player2.deck.rank_of_card_at(2))
      player1
    elsif self.type == :basic && (player2.deck.rank_of_card_at(0)) >
    (player1.deck.rank_of_card_at(0)) || self.type == :war &&
    (player2.deck.rank_of_card_at(2)) == (player1.deck.rank_of_card_at(2))
      player2
    else self.type == :mutually_assured_destruction
      "nobody wins this round!"
    end
  end
end