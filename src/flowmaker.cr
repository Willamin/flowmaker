require "ecr"

module Flowmaker
  VERSION = {{ `shards version #{__DIR__}`.chomp.stringify }}
end

class Action
  property name : String
  property params = Hash(String, String).new

  def initialize(@name); end

  ECR.def_to_s("#{__DIR__}/action.xml.ecr")
end

class PlistTemplate
  def initialize(@actions : Array(Action)); end
  ECR.def_to_s("#{__DIR__}/flowplist.xml.ecr")
end

module Flowmaker
  def self.workflow
    a = [] of Action
    yield a
    PlistTemplate.new(a).to_s
  end
end

class Flowmaker::Workflow
  @actions = [] of Action
  def action(name : String, &block)
    a = Action.new(name)
    with a yield
    @actions << a
  end

  def to_s(io)
    io << PlistTemplate.new(@actions)
  end
end