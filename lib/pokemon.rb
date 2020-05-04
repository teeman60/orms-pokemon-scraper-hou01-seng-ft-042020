class Pokemon
  attr_accessor :db, :name, :type, :id 
  
  def initialize(id: id, name: name, type: type, db: db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end


  def self.find(id, db)
    id = db.execute("SELECT id FROM pokemon WHERE id = ?", id).flatten[0]
    name = db.execute("SELECT name FROM pokemon WHERE id = ?", id).flatten[0]
    type = db.execute("SELECT type FROM pokemon WHERE id = ?", id).flatten[0]
    
    Pokemon.new(id: id, name: name, type: type, db: db)
  end
  
end
