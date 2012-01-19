aliased_sql -- Adds to_aliased_sql method to active record relations
====================================================================

Active record relations have a `to_sql` method that converts relations
into SQL select expressions. These expressions however reference the
table specified in the `SELECT` expression's `FROM` clause by the
acutal table name. The upshot of this is that it can be difficult to
compose multiple SQL expressions created this way if they reference
the same table.

I make no pretense that building up SQL expressions this way is a good
idea and it certainly is not a very Railsy way of doing things. But
if, like myself, you are a weak Rails programmer, I hope you find this
useful in someway.

Install
-------

First add the following line to your Rails `Gemfile`.

    gem 'aliased_sql', :git => 'git://github.com/jmchilton/aliased_sql.git'

Then simply run `bundle`.

Usage
-----

Simply `require 'aliased_sql'` and then use the `to_aliased_sql`
method. See the [spec][spec] for more details.

[spec]: http://github.com/jmchilton/aliased_sql/tree/master/spec/lib/aliased_sql_spec.rb

