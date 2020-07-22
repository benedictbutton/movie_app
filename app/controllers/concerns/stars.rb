module Stars
  extend ActiveSupport::Concern

  module ClassMethods

    def add_stars(score)
      score = score.to_i
      case score
      when 0 then ["white", "white", "white", "white", "white"]
        when 1 then ["yellow", "white", "white", "white", "white"]
        when 2 then ["yellow", "yellow", "white", "white", "white"]
        when 3 then ["yellow", "yellow", "yellow", "white", "white"]
        when 4 then ["yellow", "yellow", "yellow", "yellow", "white"]
        when 5 then ["yellow", "yellow", "yellow", "yellow", "yellow"]
      end
    end
  end
end
