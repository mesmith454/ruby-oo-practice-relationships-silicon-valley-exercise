require 'pry'

class Startup
    attr_reader :name, :founder, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
    
    # def name
    #     @name
    # end

    # def domain
    #     @domain
    # end

    # def founder
    #     @founder
    # end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.find{|founder| @@all.founder == founder}
    end

    def self.domains
        @@all.map{|startup| startup.domain} #self?
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.count
    end

    def total_funds
        total_sum = 0
        FundingRound.all.each do |funding_round| total_sum += funding_round.investment
        end
        total_sum
    end

    def investors
        FundingRound.map {|vencap| vencap.venture_capitalist.name}.uniq
    end
end
