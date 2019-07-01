## 1. Belongs_To (1-to-1 / FK in Current Model)
  
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


## 2. Has_One (1-to-1 / FK in Other Model)

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

## 4. Has_One :Through (1-to-1-n)
  
  ![img](https://i.ibb.co/z56TZkq/has-one-through.png)
  
  * Models supplier.rb
    ```ruby
    class Supplier < ApplicationRecord
      has_one :account
      has_one :account_history, through: :account
      end
    ```
    
  * Models account.rb
    ```ruby
    class Account < ApplicationRecord
        belongs_to :supplier
        has_one :account_history
    end
    ```
    
  * Models account_history.rb
    ```ruby
    class AccountHistory < ApplicationRecord
        belongs_to :account
    end
    ```
    
  * Controller
    ```ruby
    class WelcomeController < ApplicationController
        def index
            @suppliers = Supplier.all
            @accounts = Account.all
            @account_histories = AccountHistory.all
        end
    end
    ```
    
  * How it works? (html.erb)
    - From `@suppliers = Supplier.all`
    ```ruby
    <table border="1">
        <thead>
            <tr><th colspan="3">Supplier Model</th></tr>
            <tr>
                <th>Name</th>
                <th>Code Number</th>
                <th>Activity</th>
            </tr>
        </thead>
        <tbody>
            <% @suppliers.each do |s| %>
            <tr>
                <td> <%= s.name %> </td>
                <td> <%= s.account.code_number %> </td>
                <td> <%= s.account.account_history.activity %> </td>
            </tr>
            <% end %>
        </tbody>
    </table>
    ```
    
    - From `@accounts = Account.all`
    ```ruby
    <table border="1">
        <thead>
            <tr><th colspan="3">Account Model</th></tr>
            <tr>
                <th>Name</th>
                <th>Code Number</th>
                <th>Activity</th>
            </tr>
        </thead>
        <tbody>
            <% @accounts.each do |a| %>
            <tr>
                <td> <%= a.supplier.name %> </td>
                <td> <%= a.code_number %> </td>
                <td> <%= a.account_history.activity %> </td>            
            </tr>
            <% end %>
        </tbody>
    </table>
    ```
    
    - From `@account_histories = AccountHistory.all`
    ```ruby
    <table border="1">
        <thead>
            <tr><th colspan="3">Account History Model</th></tr>
            <tr>
                <th>Name</th>
                <th>Code Number</th>
                <th>Activity</th>
            </tr>
        </thead>
        <tbody>
            <% @account_histories.each do |ah| %>
            <tr>
                <td> <%= ah.account.supplier.name %> </td>
                <td> <%= ah.account.code_number %> </td>
                <td> <%= ah.activity %> </td>            
            </tr>
            <% end %>
        </tbody>
    </table>
    ```
    
## 5. Has_Many (1-to-M / FK in Other Model)
  
  ![img](https://i.ibb.co/RSNQ76X/image.png)
  
  * Models author.rb
    ```ruby
    class Author < ApplicationRecord
        has_many :books
    end
    ```
    
  * Models book.rb
    ```ruby
    class Book < ApplicationRecord
        belongs_to :author
    end
    ```
  
  * Controller
    ```ruby
    class WelcomeController < ApplicationController
        def index
            @authors = Author.all
            @books = Book.all
        end
    end
    ```
  
  * How it works? (html.erb)
  
    - From `@authors = Author.all`
    ```ruby
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr class="text-center"><th colspan="2">Author Model</th></tr>
            <tr class="text-center">
                <th>Author</th>
                <th>Books List</th>
            </tr>
        </thead>
        <tbody>
        <% @authors.each do |a| %>
            <tr>
                <td><%= a.name %></td>
                <td>
                    <ul>
                    <% a.books.each do |b| %>
                        <li><%= b.book_title %></li> 
                    <% end %>
                    </ul>                                
                </td>
            </tr>
        <% end %>
        </tbody>
    </table>    
    ```
    
    - From `@books = Book.all`
    ```ruby
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr class="text-center"><th colspan="2">Book Model</th></tr>
            <tr class="text-center">
                <th>Author</th>
                <th>Books Title</th>
            </tr>
        </thead>
        <tbody>
        <% @books.each do |b| %>
            <tr>
                <td><%= b.author.name %></td>
                <td><%= b.book_title %></td>
            </tr>
        <% end %>
        </tbody>
    </table>
    ```
    

## 6. Has_Many :Through
## 7. Has_Has_And_Belongs_To_Manyone 

  

