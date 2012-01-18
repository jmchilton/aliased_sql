# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "aliased_sql/version"

Gem::Specification.new do |s|
  s.name        = "aliased_sql"
  s.version     = AliasedSql::VERSION
  s.authors     = ["John Chilton"]
  s.email       = ["jmchilton@gmail.com"]
  s.homepage    = "https://github.com/jmchilton/aliased_sql"
  s.description = %q{This gem adds a to_aliased_sql(alias) to active record relations to use in lieu of to_sql when the selection table needs to have an SQL alias.}
  s.summary     = %q{Adds to_aliased_sql method to active record relations.}

  s.rubyforge_project = "aliased_sql"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "activerecord", ">= 3.0"  

end
