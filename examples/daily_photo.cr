require "../src/flowmaker"

wf = Flowmaker::Workflow.new
wf.action("is.workflow.actions.getlastphoto") do
  params["WFGetLatestPhotosActionIncludeScreenshots"] = "<false/>"
end

wf.action("is.workflow.actions.savetocameraroll") do
  params["UUID"] = "<string>EFF039EC-C0B8-45DA-A082-FA79A3C4F5DE</string>"
  params["WFCameraRollSelectedGroup"] = "<string>Every Day</string>"
end

puts wf