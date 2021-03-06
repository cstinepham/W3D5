require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
      unless @columns
        columns = DBConnection.execute2(<<-SQL)
          SELECT
            *
          FROM
            #{self.table_name}
        SQL

        @columns = columns.first.map {|column| column.to_sym}
      end
    end

  def self.finalize!
    self.columns.each do |name|
      define_method(name) do
        self.attributes[name]
      end
    # setter
      define_method("#{name}=") do |value|
        self.attributes[name] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.to_s.tableize
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
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
