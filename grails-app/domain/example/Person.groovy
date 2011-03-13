package example

class Person {
	
	String username
	String avatar
	String description
	String web
	
	static hasMany = [likes:Like]

    static constraints = {
		username(blank:false)
		avatar(blank:true)
		description(blank:true)
		web(blank:true)
    }

	def likes(){
		def likes = Like.findAllByPerson(this,[fetch: [wifi: 'join'], cache:true])
		return likes
	}
	
	static mapping = {
		cache 'read-write'
	}
	
}
