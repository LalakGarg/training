class ATM
    def run
        loop do
            puts "L to Login or C to Create new user:"
            input = gets.chomp
            case input.downcase
            when "l"
              login
              break
            when "c"
              create_user
              break
            else
                puts "Please enter L/C"
            end
        end
        menu
    end

    def login
        loop do
            puts "Enter username:"
            user_name = gets.chomp
            @user = User.find_by_name(user_name)
            unless @user
              puts "Username doesn't exist"
            else
              Account.display_account(user_name)
              puts "Enter password:"
              password = gets.chomp
              password == @user.password ? break : puts("Wrong password")
            end
        end
    end

    def create_user
        puts "What is your name?"
        name = gets.chomp
        puts "How old are you?"
        age = gets.chomp.to_i
        if age < 16
          puts "Minimum age slould be 16, Account can not be created."
        else
          puts "Enter your user name:"
          user_name = gets.chomp
          puts "Enter your password:"
          password = gets.chomp
          @user = User.create(user_name, name, age, password)
          puts "Thank you for making an account with us, please open a bank account."
          open_account
        end
    end

    def open_account
        puts "Enter account name: saving or current"
        account_name = gets.chomp
        @account = Account.create(@user.user_name, account_name, 0)
    end

    def show_balance
      puts "Which account would you like to withdraw from ?: "
      account_id = gets.chomp.to_i
      @account = Account.find_by_id(account_id)
      if @account
        puts "Your balance is Rs#{@account.balance}"
      else
        puts "Account does not exist"
      end
    end

    def deposit
        puts "To which account you would like to deposit ?:"
        account_id = gets.chomp.to_i
        @account = Account.find_by_id(account_id)
        if @account
            puts "How much amount would you like to deposit?:"
            deposit_amount = gets.chomp.to_f
            if deposit_amount < 0
                puts "Please enter valid amount."
            else
                @account.balance = @account.balance + deposit_amount
                @account.save
            end
        end
    end

    def withdraw
        puts "Which account would you like to withdraw from ?: "
        account_id = gets.chomp.to_i
        @account = Account.find_by_id(account_id)
        if @account
            loop do
                puts "How much amount you what to withdraw? max: Rs#{@account.balance}"
                withdraw_amount = gets.chomp.to_f
                if withdraw_amount <= @account.balance
                    @account.balance = @account.balance - withdraw_amount
                    @account.save
                    break
                elsif withdraw_amount > @account.balance
                    puts "Low balance."
                end
            end
        end
    end

    def transfer
        puts "Which account would you like to transfer from ?: "
        from_account_id = gets.chomp.to_i
        @from_account = Account.find_by_id(from_account_id)
        if !@from_account
            puts "Account not found."
        elsif @from_account.balance == 0
            puts "Sorry, there is no balance in account."
        else
            puts "Error"
        end
        puts "How much amount you what to transfer? max: Rs#{@from_account.balance}"
        from_amount = gets.chomp.to_f
        puts "Which account would you like to transfer ?:"
        to_account_id = gets.chomp.to_i
        @to_account = Account.find_by_id(to_account_to)
        if !@to_account
            puts "Account not found."
        else
            if from_amount <= @from_account.balance
            @from_account.balance = @from_account.balance - from_amount
            @to_account.balance += from_amount
            @from_account.save
            @to_account.save
            elsif from_amount > @from_account.balance
                puts "Low balance."
            end
        end
    end
    
    def menu
        loop do
            @account = Account.find_by_name(@user.user_name)
            if @account.count > 0
              puts "Accounts: "
              @account.each { |account| puts "#{account.id} #{account.name} Rs#{account.balance.round(2)}" }
            end
            puts "1. Open an account\n2. Show Balance\n3. Deposit\n4. Withdraw\n5. Transfer\n6. Exit"
            case input = gets.chomp.to_i
            when 1
              open_account
            when 2
              show_balance
            when 3
              deposit
            when 4
              withdraw
            when 5
              transfer
            when 6
              puts "Thank you. Have a nice day"
              break
            else
              puts "Not a valid option"
            end
        end
    end
end