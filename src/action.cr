class Action
  alias PlistType = String | Bool
  property name : String
  property params = Hash(String, PlistType).new

  def initialize(@name); end

  ECR.def_to_s("#{__DIR__}/action.xml.ecr")

  def plistify(value : PlistType)
    case value
    when .is_a?(String) then "<string>#{value}</string>"
    when true then "<true/>"
    when false then "<false/>"
    else raise "Invalid Property List Type: #{value}"
    end
  end
end
  