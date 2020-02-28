require_relative "../config/environment.rb"

class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_accessor :id, :name, :grade
  
  def initialize(@id = nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end
  
  def create_table
    sql = <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT, 
        grade TEXT
      )
    SQL
    DB[:conn].execute(sql)
  end
  
  def drop_table
    DB[:conn].execute("DROP TABLE IF EXISTS students")    
  end
  
  def save
    if self.id
      self.update
    else
      sql = <<-SQL 
        INSERT INTO students (name, grade)
        VALUES (?,?)
      SQL

      DB[:conn].execute(sql, self.name, self.grade)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
    end
  end
  
  def create

  end
  
  def new_from_db
    id = row[0]
    name = row[1]
    grade = row[2]
    self.new(id, name, grade)    
  end
  
  def find_by_name
    
  end
  
  def update
    
  end
  
end
