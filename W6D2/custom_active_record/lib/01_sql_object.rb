require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # want Cat.columns == [:id, :name, :owner_id]
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL).first
      SELECT
       * 
      FROM
       #{self.table_name} 
    SQL
    cols.map!(&:to_sym)
    @columns = cols
  end

#   DBConnection.execute2(<<-SQL)
# execute2 will get columns from the table
#..and returns into an array
#   SELECT
#     *
#   FROM
#     cats
# SQL
# => [
#   ["id", "name", "owner_id"],
#   {"id"=>1, "name"=>"Breakfast", "owner_id"=>1},
#   {"id"=>2, "name"=>"Earl", "owner_id"=>2},
#   {"id"=>3, "name"=>"Haskell", "owner_id"=>3},
#   {"id"=>4, "name"=>"Markov", "owner_id"=>3}
# ]

  def self.finalize!
    self.columns.each do |name|
      define_method(name) do
        self.attributes[name]
      end

      define_method("#{name}=") do |value|
        self.attributes[name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.name.tableize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    results.map { |result| self.new(result)}
  end

  def self.find(id)
    results = DBCOnnection.execute(<<-SQL, id)
      SELECT
       #{table_name}.*
      FROM
       #{table_name}
      WHERE
       #{table_name}.id = ?
    SQL

    parse_all(results).first
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}"
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

# cat = Cat.new
# cat.attributes #=> {}
# cat.name = "Gizmo"
# cat.attributes #=> { name: "Gizmo" }

  def attribute_values
    self.class.columns.map { |attr| self.send(attr)}
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
