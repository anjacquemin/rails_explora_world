import TwilioVideoController from 'stimulus-twilio-video'

export default class extends TwilioVideoController {
  static targets = ['noCall', 'awaitingBuddy', 'joinCallButton', 'endCallButton', "liveDisplay", "map"]

  callStarted() {
    console.log('Call start')
    this.noCallTarget.classList.add('d-none')
    this.awaitingBuddyTarget.classList.remove('d-none')
    // console.log(this.liveDisplayTarget)
    this.liveDisplayTarget.classList.remove('d-none')
    this.joinCallButtonTarget.classList.add('d-none')
    this.endCallButtonTarget.classList.remove('d-none')
  }

  callEnded() {
    console.log('Call ended!')
    this.noCallTarget.classList.remove('d-none')
    this.liveDisplayTarget.classList.add('d-none')
    this.awaitingBuddyTarget.classList.add('d-none')
    this.joinCallButtonTarget.classList.remove('d-none')
    this.endCallButtonTarget.classList.add('d-none')
  }

  buddyJoined() {
    console.log('Buddy has joined')
    this.awaitingBuddyTarget.classList.add('d-none')
  }

  buddyLeft() {
    console.log('Buddy has left')
  }

  togglemap() {
    console.log(`TOGGLE MAP`)
    console.log(this.mapTarget.style)
    if (this.mapTarget.style.transform == "translateY(-5px)"){
      this.mapTarget.style.transform = "translateY(200px)"
    } else {
      this.mapTarget.style.transform = "translateY(-5px)"
    }
    // this.mapTarget.classList.toggle('d-none')
  }
}
