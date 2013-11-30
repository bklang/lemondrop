Lemondrop
=========

An Adhearsion plugin providing integration with Redis

Configuration
-------------

As with all Adhearsion plugins, type `rake config:show` to see the list of configuration options.

Usage
-----

```ruby
Lemondrop.set "foo", "bar"

Lemondrop.get "foo" #-> bar

```
