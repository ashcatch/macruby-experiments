class AppDelegate
  def applicationDidFinishLaunching(notification)
    NSApp.hide nil
    NSTimer.scheduledTimerWithTimeInterval 5,
      target:self,
      selector:'teaReady:',
      userInfo:nil,
      repeats:false
  end

  def teaReady(theTimer)
    NSApp.activateIgnoringOtherApps true
  end
end
