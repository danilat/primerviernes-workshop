package example

class Wifi {
	String place
	String ssid
	String password
	String address
	String city
	Integer likesCounter = 0
	
	Double lat
	Double lng
	
	Person creator
	
	static hasMany = [likes:Like]
	
	def create(){
		def saved = this.save(flush: true)
		if(saved){
			this.likesTo(this.creator)
		}
		return saved
	}
	
	def likesTo(person){
		likesCounter++
		def like = new Like(wifi: this, person: person)
		like.save(flush: true)
		return like
	}
	
	def likes(){
		def likes = Like.findAllByWifi(this,[fetch: [person: 'join']])
		return likes
	}
	
    static constraints = {
		place(blank:false)
		ssid(blank:false)
		address(blank:false)
		city(blank:false)
		password(nullable:true, blank:true)
		likesCounter(nullable:true, blank:true)
		lat(nullable:true)
		lng(nullable:true)
		creator(nullable:true)
    }

	static mapping = {
		creator fetch: 'join'
	}
}
