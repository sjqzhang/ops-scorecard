import grails.util.GrailsUtil

class BootStrap {

     def init = { servletContext ->
         if(GrailsUtil.environment=="development"){
            new User(login:'default',password:'default',firstName:'d',lastName:'d').save()
         }
     }
     def destroy = {
     }
} 