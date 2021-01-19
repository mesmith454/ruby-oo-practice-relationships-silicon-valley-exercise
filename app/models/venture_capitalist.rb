require 'pry'
class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end
    # def name
    #     @name
    # end
    # def total_worth
    #     @total_worth
    # end
    def self.all
        @@all
    end
    def self.tres_commas_club
       @@all.select |venturecap| @total_worth > 1000000000
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, type, investment, self)
    end
    def funding_rounds
        FundingRound.select {|vencap| vencap.venture_capitalist == self}
    end

    def portfolio
        FundingRound.map{|fundinground| fundinground.startup}.uniq
    end

    def biggest_investment
        FundingRound.find{|investment| investment.venture_capitalist}.max
    end
    def invested(domain)
        FundingRound.all.select {|fundinground| fundinground.startup.domain == self}
    end
end
