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
    create table if not exists songs (
      id INTEGER PRIMARY KEY,
      name TEXT,
      album TEXT
    );
      SQL
    DB[:conn].execute(sql)
  end
end

def self.drop_table
  sql = <<-SQL
    drop table ?;
    SQL
    DB[:conn].execute(sql, self)
  end
end


end


# Remember, you can access your database connection anywhere in this class
#  with DB[:conn]
