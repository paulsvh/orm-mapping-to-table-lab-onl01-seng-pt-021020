class Student
attr_accessor :name, :grade
attr_reader :id

  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end

  def self.create_table
    sql = <<-SQL
      create table if not exists students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT
        );
        SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "drop table if exists students"
      DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
      insert into students (name, grade)
      values (?, ?)
      SQL
    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("select last_insert_rowid() from students")[0][0]
  end

  def self.create(name:, grade:)
    student = Student.new(name, grade)
    student.save
    student
  end


end


# Remember, you can access your database connection anywhere in this class
#  with DB[:conn]
