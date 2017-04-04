class Employee

  attr_accessor :salary

  def initialize name, title, salary, boss
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @multiplier = 1
  end

  def bonus multiplier
    @salary * multiplier
  end
end

class Manager < Employee

  attr_accessor :underlings

  def initialize name, title, salary, boss
    super name, title, salary, boss
    @underlings = []
  end

  # def initialize name, title, salary, boss, underlings
  #   super name, title, salary, boss
  #   @underlings = underlings
  # end

  def bonus multiplier
    employee_salary = @underlings.reduce(0){|sum, employee|
      sum + employee.salary + (employee.class == Manager ? employee.sum_of_underlings : 0)
    }
    employee_salary * multiplier
  end

  def sum_of_underlings
    @underlings.reduce(0){|sum, employee| sum + employee.salary}
  end
end

# manager = Manager.new("Bob", "Software Engineer")
ned = Manager.new("Ned", "Founder", 1_000_000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
ned.underlings << darren
shawn = Employee.new("Shawn", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
darren.underlings << shawn
darren.underlings << david

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
