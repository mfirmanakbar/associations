class WelcomeController < ApplicationController

    def index
        @developers = Developer.all
    end

end