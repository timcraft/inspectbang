Inspect with a bang!
====================


Easy peasy "puts" style debugging in your browser, for Rails. Use the
`Object#inspect!` method to output an HTML safe representation of the
object in your browser.


Installation
------------

Add inspectbang to your Gemfile and run `bundle`:

```ruby
group :development do
  gem 'inspectbang', '~> 1.0.0'
end
```


Usage
-----

Just call the `inspect!` method on any object. For example, here's how you
would inspect the form data that was posted to your application:

```ruby
class SomeController < ApplicationController
  def some_form_action
    params.inspect!
  end
end
```
