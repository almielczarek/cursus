# Cursus

Cursus is a pluggable elixir kanban implementation.
It is built on top of Ecto, with its own configurable repository (it defaults to a postgres storage backend).

It provides two interfaces
* Websocket API (required Phoenix dependency)
* Elixir API

## Installation

The package can be installed by adding `cursus` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cursus, "~> 0.1.0"}
  ]
end
```
