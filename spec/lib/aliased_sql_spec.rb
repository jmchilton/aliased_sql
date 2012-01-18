require 'spec_helper'
require 'aliased_sql'

describe AliasedSql do

  # Fake active record model for testing
  class Foo < ActiveRecord::Base
  end

  it "should cause to_aliased_sql to be a method of active record relations" do
    Foo.select("bar").should respond_to(:to_aliased_sql)
  end

  describe "to_aliased_sql" do

    class FakeRelation         
      include AliasedSql

      def to_sql        
        @sql
      end
      
      def table_name 
        "foo"
      end

      def initialize(sql)
        @sql = sql
      end

    end
  
    it "should define alias in from clause" do
      aliased_sql_for('SELECT * FROM "foo"').should include('FROM "foo" the_foo')
    end

    it "should replace table name with alias in the select clause" do       
      aliased_sql_for('SELECT "foo"."bar" FROM "foo"').should include('SELECT "the_foo"."bar"')
    end

    it "should replace table name with alias in where clause" do
      aliased_sql_for('SELECT * FROM "foo" WHERE "foo"."bar" > 6').should include('WHERE "the_foo"."bar" > 6')
    end

    def aliased_sql_for(original_sql)
      FakeRelation.new(original_sql).to_aliased_sql("the_foo")
    end

  end
  
end