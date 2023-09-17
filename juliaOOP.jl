using OOPMacro

@class Employee begin
    name::String
    position::String
    salary::Float64

    function construct_Employee(self, name, position; salary=0.0)
        self.name = name
        self.position = position
        self.salary = salary
    end

    __init__(self, name, position; salary=0.0) = construct_Employee(self, name, position; salary=salary)

    greet(self) = println("Hello, my name is $(self.name) and I work as a $(self.position).")
end

@class Manager(Employee) begin
    team::Vector{Employee}

    function construct_Manager(self, name, position, team; salary=0.0)
        construct_Employee(self, name, position; salary=salary)
        self.team = team
    end

    __init__(self, name, position, team; salary=0.0) = construct_Manager(self, name, position, team; salary=salary)

    introduce_team(self) = begin
        println("I manage a team of $(length(self.team)) employees:")
        for member in self.team
            greet(member)
        end
    end
end

# Create instances and call methods
jane = Employee("Jane", "Engineer", salary=70000.0)
john = Employee("John", "Developer", salary=80000.0)
mary = Manager("Mary", "Team Leader", [jane, john], salary=90000.0)

greet(mary)
introduce_team(mary)
