require_relative "employee"

class Manager < Employee

    def initialize(name, title, salary, boss)
        @employees = []
        super
    end

    def hire(employee)
        @employees << employee
    end

    def bonus(multiplier)
        @employees.map(&:salary).sum * multiplier
    end

end