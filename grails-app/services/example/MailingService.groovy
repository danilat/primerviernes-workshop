package example

import grails.plugin.jms.Queue

class MailingService {
	static transactional = false
	
    def mailService

	static exposes = ['jms']

    def sendEmail(email, mailSubject, body) {
		mailService.sendMail {
			to(email)
			subject(mailSubject)
			html(body)
		}
		return
    }

	@Queue
	def sendEmail(message) {
		sendEmail(message.email, message.subject, message.body)
    }
}
