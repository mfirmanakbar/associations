class WelcomeController < ApplicationController

    def index
        @developers = Developer.all
        @clients = Client.all
        @tickets = Ticket.all
        
        @suppliers = Supplier.all
        @accounts = Account.all
        @account_histories = AccountHistory.all

        @authors = Author.all
        @books = Book.all
    end

end