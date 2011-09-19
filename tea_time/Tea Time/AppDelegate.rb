$teaTimeSeconds = 3 * 60

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
    totalCountDown = (@timeFinished - Time.now).round.to_i
    minutesCountDown = totalCountDown / 60
    secondsCountDown = totalCountDown % 60
    @statusItem.setTitle "☕ #{minutesCountDown}:#{'%02d' % secondsCountDown}"
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
