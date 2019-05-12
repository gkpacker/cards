defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test 'shuffle randomized the deck ordenation' do
    deck = Cards.create_deck

    refute Cards.shuffle(deck) == deck
  end

  test '' do

  end
end
