class Employee

    attr_reader :name, :title, :salary
    attr_accessor :boss

    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        return @salary * multiplier
    end



end

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss = nil, employees = [])
        super(name, title, salary, boss)
        @employees = employees
    end

    def bonus(multiplier)
        self.find_employees_salary_total * multiplier
    end

    def add_employee(employee)
        @employees << employee
        employee.boss = self
    end

    def find_employees_salary_total
        salary_total = 0
        queue = [self]
        until queue.empty?
            current_employee = queue.shift
            salary_total += current_employee.salary
            if current_employee.is_a?(Manager) && !current_employee.employees.nil?
                queue += current_employee.employees
            end
        end
        salary_total - self.salary
    end

end

