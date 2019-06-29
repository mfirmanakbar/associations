## 1. Belongs_To (1-to-1)
  
  ![img](https://i.ibb.co/0j3sdm4/d1.png)
  
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


## 2. Has_One (1-to-1)

![img](https://i.ibb.co/5x5njTB/d2.png)

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
  
## 3. What's different between belongs_to and has_one?
    
  ```ruby
  class Foo < ApplicationRecord
  end
  ```
  
  * If foo `belongs_to :bar`, then the foos table has a bar_id column
  ![img](https://i.ibb.co/RS84Ky1/foo-belongs-to-bar.png)
  
  
  * If foo `has_one :bar`, then the bars table has a foo_id column
  ![img](https://i.ibb.co/kSpBq3S/foo-has-one-bar.png)
