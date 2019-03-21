require_relative('../db/sqlrunner.rb')
require_relative('./house.rb')
require('pry')

class Student

attr_reader :first_name, :last_name, :house, :age, :id

def initialize(options)
  @first_name = options['first_name']
  @last_name = options['last_name']
  @house = options['house'].to_i
  @age = options['age'].to_i
  @id = options['id'].to_i if options['id']
end

def save
  sql = 'INSERT INTO students (first_name,last_name, house, age)
  VALUES
  ($1, $2, $3, $4)
  RETURNING *'
  values = [@first_name, @last_name, @house, @age]
  student = SqlRunner.run(sql, values)
  @id = student.first['id'].to_i
end

def self.find_student_by_id(id)
  sql = 'SELECT * FROM students WHERE id = $1'
  values = [id]
  student_hash = SqlRunner.run(sql, values)
  student = Student.new(student_hash.first)
  return student
end

def self.find_all
  sql ='SELECT * FROM students'
  student_hash = SqlRunner.run(sql)
  student = student_hash.map { |student| Student.new(student)}
  return student
end

def find_students_house
  sql = 'SELECT * FROM houses
        INNER JOIN students ON students.house = houses.id
        WHERE houses.id = $1'
  values = [@house]
  house_hash = SqlRunner.run(sql, values)
  house = House.new(house_hash.first)
  return house.name
end


end
