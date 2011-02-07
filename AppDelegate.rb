$teaTimeSeconds = 5

class AppDelegate
  def applicationDidFinishLaunching(notification)
    NSApp.hide nil
    NSTimer.scheduledTimerWithTimeInterval $teaTimeSeconds,
      target:self,
      selector:'teaReady:',
      userInfo:nil,
      repeats:false

    @statusItem = NSStatusBar.systemStatusBar.statusItemWithLength NSVariableStatusItemLength
    @timeFinished = Time.now + $teaTimeSeconds
    @countDownTimer = NSTimer.scheduledTimerWithTimeInterval 1,
      target:self,
      selector:'countDown:',
      userInfo:nil,
      repeats:true

    self.countDown(nil)
  end

  def countDown(theTime)
    @statusItem.setTitle "☕ #{(@timeFinished - Time.now).round.to_i}"
  end

  def teaReady(theTimer)
    @countDownTimer.invalidate
    @statusItem.setTitle "☕ fertig!"
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
