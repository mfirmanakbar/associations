class WelcomeController < ApplicationController

    def index
        @developers = Developer.all
        @clients = Client.all
        @tickets = Ticket.all
    end

end