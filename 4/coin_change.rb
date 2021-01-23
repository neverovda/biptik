module Cashier
  COINS = [100, 25, 10, 5, 1].freeze

  class << self
    def change(sum)
      change_tray = []
      loop do
        return change_tray if sum.zero?

        coin = COINS.find { |c| c <= sum }
        sum -= coin
        change_tray << coin
      end
    end
  end
end
