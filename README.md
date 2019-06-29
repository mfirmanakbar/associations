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
          <li>Developer Name: <%= d.name %> and Team Name: <%= d.team.team_name %> </li>
      </ul>
  <% end %>
  ```


## 2. Has_one

* table clients

  | Column Name    |
  | -------------- |
  | id             |
  | name           |
  | team_id        |

* table tickets

  | Column Name    |
  | -------------- |
  | id             |
  | ticket_label   |
  | client_id      |

* Models client.rb
  ```ruby
  class Client < ApplicationRecord
    has_one :ticket
  end
  ```

* Models ticket.rb
  ```ruby
  class Ticket < ApplicationRecord
  end
  ```

* Controller
  ```ruby
  class WelcomeController < ApplicationController
      def index
          @clients = Client.all
      end
  end
  ```

* How it works? (html.erb)
   ```ruby
    <% @clients.each do |c| %>
        <ul>
            <li>Client Name: <%= c.name %> and Tikcet Label: <%= c.ticket.ticket_label %> </li>
        </ul>
    <% end %>
    ```
  
  
