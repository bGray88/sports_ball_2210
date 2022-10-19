class Player

  attr_reader :name, :first_name, :last_name,
              :contract_length, :monthly_cost,
              :total_cost, :nickname

  def initialize(name, cost, contract)
    @name = name
    @first_name = @name.split[0]
    @last_name = @name.split[1]
    @contract_length = contract
    @monthly_cost = cost 
    @total_cost = @contract_length * @monthly_cost
    @nickname = nil
  end

  def set_nickname!(nickname)
    @nickname = nickname
  end
end