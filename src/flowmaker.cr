require "ecr"
require "./plist_template"
require "./action"
require "./actions/*"

module Flowmaker
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
end

class Flowmaker::Workflow
  @actions = [] of Action
  def action(name : String, &block)
    a = Action.new(name)
    with a yield
    @actions << a
  end

  def action(action : Action)
    @actions << action
  end

  def to_s(io)
    io << PlistTemplate.new(@actions)
  end
end