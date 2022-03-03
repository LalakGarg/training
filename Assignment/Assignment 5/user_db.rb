module User_DB
    @@users_data = [
        { user_name: "anil123", name: "anil", age: "21", password: "password1" },
        { user_name: "mikky60", name: "mikky", age: "45", password: "password2" },
        { user_name: "dilip45", name: "dilip", age: "18", password: "password3" },
        { user_name: "mohit54", name: "mohit", age: "30", password: "password4" }
    ]

    def find_by_name(user_name)
        user_hash = @@users_data.detect {|user_hash| user_hash[:user_name] == user_name}
        user_hash ? make_instance(user_hash) : nil
    end

    def make_instance(user_hash)
        new(user_hash[:user_hash], user_hash[:name], user_hash[:age], user_hash[:password])
    end

    def create(user_name, name, age, password)
        user_hash = { user_name: user_name, name: name, age: age, password: password }
        @@users_data << user_hash
        make_instance(user_hash)
    end
end