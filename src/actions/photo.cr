# Photo Actions

class Photo::GetLastPhoto < Action
  getter name = "is.workflow.actions.getlastphoto"
  def initialize(include_screenshots : Bool)
    params["WFGetLatestPhotosActionIncludeScreenshots"] = include_screenshots
  end
end
