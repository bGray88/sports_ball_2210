require './lib/player'

class Team

  attr_reader :roster, :player_count,
              :long_term_players, :short_term_players,
              :total_value, :details,
              :average_cost_of_player

  def initialize(name, city)
    @name = name
    @city = city
    @roster = []
    @player_count = 0
    @long_term_players = []
    @short_term_players = []
    @total_value = 0
    @details = {}
    @average_cost_of_player = ""
    @players_by_last_names = ""
  end

  def add_player(player)
    @roster << player
    @player_count += 1
    term_length(player)
    calculate_value(player)
    set_details
    calculate_average(player)
  end

  def term_length(player)
    if player.contract_length > 24
      @long_term_players << player
    else
      @short_term_players << player
    end
  end

  def calculate_value(player)
    @total_value += player.total_cost
  end

  def set_details
    @details["total_value"] = @total_value
    @details["player_count"] = @player_count
  end

  def calculate_average(player)
    avg_num = @total_value / @player_count
    avg_num = avg_num.to_s.chars.insert(-4, ',').join
    avg_num = avg_num.to_s.chars.insert(-8, ',').join
    @average_cost_of_player = "$#{avg_num}"
  end

  def players_by_last_name
    last_names = roster.map do |player|
      player.last_name
    end.sort.join(', ')
  end
end