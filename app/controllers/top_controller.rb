class TopController < ApplicationController
    def index
        @colognes = Cologne.all
        @cologne = Cologne.new
    end
end
