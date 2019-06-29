## 1. Belongs_To

* table developers

  | Column Name    |
  | -------------- |
  | id             |
  | name           |
  | team_id        |

* table teams

  | Column Name      |
  | ---------------- |
  | id               |
  | team_name        |
  
* Models developer.rb
  ```ruby
  class Developer < ApplicationRecord
      belongs_to :team
  end
  ```

* Models team.rb
  ```ruby
  class Team < ApplicationRecord
  end
  ```

* Controller
  ```ruby
  class WelcomeController < ApplicationController
      def index
          @developers = Developer.all
      end
  end
  ```

* How it works? (html.erb)
  ```ruby
  <% @developers.each do |d| %>
      <ul>
          <li>Developer Name: <%= d.name %> and team name: <%= d.team.team_name %> </li>
      </ul>
  <% end %>
  ```


## 2. Has_one
