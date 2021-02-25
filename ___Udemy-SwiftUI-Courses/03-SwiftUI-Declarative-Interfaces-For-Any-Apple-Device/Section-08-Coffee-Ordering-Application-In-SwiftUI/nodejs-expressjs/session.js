class Session {
  
  constructor(title, speaker) {
      this.title = title 
      this.speaker = speaker 
  }
  
  save() {
    // check if the session already exists 
    
    // check if the speaker is already 
    
    // save the session in the database 
  }
  
  static getSessionsBySpeaker(speaker) {
    // get sessions by speaker
  }
  
  static getSessionById(id) {
    // get session by id 
  }
  
}

module.exports = Session 