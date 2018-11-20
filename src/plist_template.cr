class PlistTemplate
  def initialize(@actions : Array(Action)); end
  
  ECR.def_to_s("#{__DIR__}/flowplist.xml.ecr")
end
