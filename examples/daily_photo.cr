require "../src/flowmaker"
require "stdimp/object/selftap"

a = [] of Action

a << Action.new("is.workflow.actions.getlastphoto").selftap do 
  params["WFGetLatestPhotosActionIncludeScreenshots"] = "<false/>"
end

a << Action.new("is.workflow.actions.savetocameraroll").selftap do
  params["UUID"] = "<string>EFF039EC-C0B8-45DA-A082-FA79A3C4F5DE</string>"
  params["WFCameraRollSelectedGroup"] = "<string>Every Day</string>"
end

puts PlistTemplate.new(a).to_s
