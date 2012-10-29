Inspect with a bang!
====================


Easy peasy "puts" style debugging in your browser, for Rails and Sinatra.


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

Use the `Object#inspect!` method to output an HTML safe representation of
the object in your browser. For example, here's how you would inspect the
form data that was posted to your Rails application:

```ruby
class SomeController < ApplicationController
  def some_form_action
    params.inspect!
  end
end
```

And here's how you would inspect the request in a Sinatra application:

```ruby
get '/' do
  request.inspect!
end
```
