require 'sqlite3'

class Doctor
  attr_accessor :name, :age, :specialty
  attr_reader :id
  
  DB = SQLite3::Database.new('data/doctors.db')

  def initialize(attributes = {})
    @id = attributes["id"]
    @name = attributes["name"]
    @age = attributes["age"]
    @specialty = attributes["specialty"]
  end

  def self.create_table
    query = "CREATE TABLE IF NOT EXISTS `doctors`(
        `id` INTEGER PRIMARY KEY AUTOINCREMENT,
        `name` TEXT,
        `age` INTEGER,
        `specialty` TEXT
    )"
    DB.execute(query)
  end

  def self.all
    query = "SELECT * FROM doctors"
    DB.execute(query)
  end

  def self.find(id)
    query = "SELECT * FROM doctors WHERE id = ?"
    DB.results_as_hash = true
    DB.execute(query, id)
  end

  def self.destroy(id)
    query = "DELETE FROM doctors WHERE id = ?"
    DB.execute(query, id)
  end
  
  def insert
    query = "INSERT INTO doctors (name, age, specialty) VALUES(?, ?, ?)"
    DB.execute(query, @name, @age, @specialty)
  end

  def update
    query = "UPDATE doctors SET age = ?, name = ?, specialty = ? WHERE id = ?"
    DB.execute(query, @age, @name, @specialty, @id)
  end
  
  def save
    if @id.nil?
      query = "INSERT INTO doctors (name, age, specialty) VALUES(?, ?, ?)"
      DB.execute(query, @name, @age, @specialty)
    else
      query = "UPDATE doctors SET age = ?, name = ?, specialty = ? WHERE id = ?"
      DB.execute(query, @age, @name, @specialty, @id)
    end
  end
end

