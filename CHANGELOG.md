#### v1.0.3

* Security
  * The template handler no longer interpolates the template path into generated Ruby source. A path containing a single quote closed the string literal, so the remainder was compiled as code by Rails; an ordinary apostrophe in a directory name raised a `SyntaxError` instead. The path is now escaped with `String#inspect`. (@dlauer)

* Bug Fixes
  * Corrected five outdated examples in the README, each confirmed against caracal 1.5.0: `font` and `style` take a hash or block rather than a string, `cell_style` uses `:background` rather than `:background_color`, `br` is not a document level command, and `strong` is not a command at all. (reported by @Alan-M-Thomaz)

* Enhancements
  * Added continuous integration across Ruby 3.1 to 3.4 and Rails 7.1 to 8.1. (@dlauer)
  * Relaxed the bundler development dependency, which made `bundle install` impossible on current bundler, and raised rspec-rails so the suite runs on modern Rails. (@dlauer)
  * Replaced Appraisal, whose configuration referenced a local checkout and covered only Rails 3.2 to 4.1, with a `RAILS_VERSION` environment variable read by the Gemfile. (@dlauer)
  * Raised the rails floor to `>= 6.0`, matching the two argument template handler signature this gem ships. (@dlauer)
  * Modernised the dummy application used by the suite: it now loads only the railties it needs rather than `rails/all`, which required ActiveRecord and sqlite3 for a gem that uses neither. (@dlauer)


#### v1.0.2

* Bug Fixes
  * Added the second parameter to the template handler, which Rails 6 requires. (@emp823)


*Releases before v1.0.2 predate this changelog; see the git history for details.*
