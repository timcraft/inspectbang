inspectbang
===========


Easy peasy "puts" style debugging in your browser, for Rails and Sinatra.


Installation
------------

Add inspectbang to your Gemfile and run `bundle`:

```ruby
group :development do
  gem 'inspectbang', '~> 1.1.0'
end
```


Example usage
-------------

Use the `Object#inspect!` method to output an HTML safe representation of
the object in your browser. For example, you could inspect form data posted
to your Rails application like this:

```ruby
class SomeController < ApplicationController
  def some_form_action
    params.inspect!
  end
end
```

Or you could inspect the request in a Sinatra application like this:

```ruby
get '/' do
  request.inspect!
end
```
