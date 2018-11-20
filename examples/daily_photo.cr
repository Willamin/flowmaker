require "../src/flowmaker"

wf = Flowmaker::Workflow.new
# wf.action("is.workflow.actions.getlastphoto") do
#   params["WFGetLatestPhotosActionIncludeScreenshots"] = false
# end

wf.action(Photo::GetLastPhoto.new(false))

wf.action("is.workflow.actions.savetocameraroll") do
  params["WFCameraRollSelectedGroup"] = "Every Day"
end

puts wf
