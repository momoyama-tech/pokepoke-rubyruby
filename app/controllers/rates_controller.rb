class RatesController < ApplicationController
  def index
    @match_results = MatchResult.all
  end
end
