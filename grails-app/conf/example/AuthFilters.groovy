package example

class AuthFilters {

    def filters = {
        wifi(controller:'wifi', action:'*') {
            before = {
                if(actionName=="create" || actionName=="save" || actionName=="edit" || actionName=="update" || actionName=="delete" || actionName=="share" || actionName=="like"){
					if(!session.person){
						redirect(controller:'home', action:'error', id:'login')
						return false
					}
				}
            }
            
        }
    }
}
