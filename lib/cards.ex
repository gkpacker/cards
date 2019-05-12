defmodule Cards do
  @moduledoc """
  Cards module handles a basic deck manipulation, where you can create a deck, shuffle it,
  deal some amount of cards, save in a file and load it.
  """

  @doc """
  Provides a list of strings representing deck cards.

  ## Examples

      iex> Cards.create_deck()
      ["Ace of Spades", "Ace of Diamonds", "Ace of Hearts", "Ace of Clubs",
      "Two of Spades", "Two of Diamonds", "Two of Hearts", "Two of Clubs",
      "Three of Spades", "Three of Diamonds", "Three of Hearts", "Three of Clubs",
      "Four of Spades", "Four of Diamonds", "Four of Hearts", "Four of Clubs",
      "Five of Spades", "Five of Diamonds", "Five of Hearts", "Five of Clubs"]
  """
  def create_deck do
    cards = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Diamonds", "Hearts", "Clubs"]

    for card <- cards, suit <- suits do
      "#{card} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Verifies whether a deck contains a card

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true
      iex> Cards.contains?(deck, "Queen of Hearts")
      false

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Deal specified amount of cards from given deck

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.deal(deck, 2)
      {["Ace of Spades", "Ace of Diamonds"],
       ["Ace of Hearts", "Ace of Clubs", "Two of Spades", "Two of Diamonds",
       "Two of Hearts", "Two of Clubs", "Three of Spades", "Three of Diamonds",
       "Three of Hearts", "Three of Clubs", "Four of Spades", "Four of Diamonds",
       "Four of Hearts", "Four of Clubs", "Five of Spades", "Five of Diamonds",
       "Five of Hearts", "Five of Clubs"]}

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)

    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term(binary)
      { :error, _reason } -> "File '#{filename}' doesn't exists"
    end
  end

  @doc """
  Creates a deck, shuffles it and deal how many cards specified as `hand_size`
  """
  def create_hand(hand_size) do
    create_deck()
    |> shuffle
    |> deal(hand_size)
  end
end
