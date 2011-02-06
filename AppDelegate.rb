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
    NSAlert.alertWithMessageText(
      'Tee ist fertig!',
      defaultButton:nil,
      alternateButton:nil,
      otherButton:nil,
      informativeTextWithFormat:'Tee ist fertig!'
    ).runModal
    NSApp.terminate nil
  end
end
