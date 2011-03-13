package example

import grails.plugin.springcache.annotations.*

class PersonController {

    def show = { 
		def person = Person.get(params.id)
		return [person:person]
	}
	
	def last = {
		def users = Person.listOrderById(max:10, order:"desc",[cache:true])
		render(template:'last', model:[users: users])
	}
	
	@Cacheable("likesPersonCache")
	def likes = {
		def person = Person.get(params.id)
		render(template:'likes', model:[likes: person.likes()])
	}
}
