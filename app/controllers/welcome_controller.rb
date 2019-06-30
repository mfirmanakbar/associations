class WelcomeController < ApplicationController

    def index
        @developers = Developer.all
        @clients = Client.all
        @tickets = Ticket.all
        
        @suppliers = Supplier.all
        @accounts = Account.all
        @account_histories = AccountHistory.all
    end

end