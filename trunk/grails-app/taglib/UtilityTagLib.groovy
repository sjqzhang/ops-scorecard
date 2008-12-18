import java.util.*
import java.text.SimpleDateFormat

class UtilityTagLib{
    def static  daysofweekkey = [Calendar.MONDAY,Calendar.TUESDAY,Calendar.WEDNESDAY,Calendar.THURSDAY,Calendar.FRIDAY,Calendar.SATURDAY,Calendar.SUNDAY];
    public static final daysofweekord = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
    public static final monthsofyearord = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];

    def frameworkService
    
    def dayOfWeek = { attrs, body ->

        def java.text.DateFormatSymbols DFS = new java.text.DateFormatSymbols(request.getLocale());
        def monthsArray = DFS.getMonths();
        def daysArray = DFS.getWeekdays();
        def daysofweek = [:];
        (0..<daysofweekord.size()).each{ i ->
            daysofweek[daysofweekord[i]]=daysArray[daysofweekkey[i]];
        }
        if(attrs.name){
            out << daysofweek[attrs.name]
        }else if(attrs.index){
            out << daysofweek[daysofweekord[attrs.index]]
        }else{
            throw new Exception("name or index attribute required")
        }
    }

    def eachDay = { attrs, body ->
        daysofweekord.each{ n ->
            body(n)
        }
    }

    def month = { attrs, body ->

        def java.text.DateFormatSymbols DFS = new java.text.DateFormatSymbols(request.getLocale());
        def monthsArray = DFS.getMonths();
        def monthsofyear = [:];
        (0..<12).each{ i ->
            monthsofyear[monthsofyearord[i]]=monthsArray[i];
        }
        if(attrs.name){
            out << monthsofyear[attrs.name]
        }else if(attrs.index){
            out << monthsofyear[attrs.index]
        }else{
            throw new Exception("name or index attribute required")
        }
    }

    def eachMonth = { attrs,body ->
        monthsofyearord.each{ n ->
            body(n)
        }
    }

    def daysOfWeekList = {
        return daysofweekord
    }

    def monthsOfYearList = {
        return monthsofyearord
    }

    def timeDuration = { attrs, body ->

        if (!attrs.start && !attrs.end){
            return;
        }
        def Date start = attrs.start
        def Date end = attrs.end
        if(null==start && null==end){
            return;
        }else if(null!=start && null==end){
            end = new Date()
        }
        attrs.duration=true
        relativeDate.call(attrs,body)
    }

    def relativeDate = { attrs, body ->
        if(attrs.atDate){
            def Date date = attrs.atDate
            def Date nowdate = new Date()
            def Calendar cal = Calendar.getInstance()
            cal.setTime(date)
            def Calendar now = Calendar.getInstance()
            now.setTime(nowdate)
            def StringBuffer val = new StringBuffer()
            if(nowdate.getTime()-date.getTime() < 1000 * 60 * 60 * 24){
                if(cal.get(Calendar.DAY_OF_MONTH) != now.get(Calendar.DAY_OF_MONTH)){
                    val << new SimpleDateFormat("MMM d ha").format(date)
                }else{
                    //same date
                    val << new SimpleDateFormat("h:mm a").format(date)
                }
            }else if(nowdate.getTime()-date.getTime() < 1000 * 60 * 60 * 24 * 7){
                //within a week
                    val << new SimpleDateFormat("E ha").format(date)
            }else if(cal.get(Calendar.YEAR)!=now.get(Calendar.YEAR)){
                    val << new SimpleDateFormat("MMM d yyyy").format(date)
            }else{
                val << new SimpleDateFormat("d/M ha").format(date)
            }
            def title=  date.toString()
            out<<"<span title=\"${title.encodeAsHTML()}\">"
            out << val
            out<<"</span>"
        }else if(attrs.elapsed || attrs.start && attrs.end){
            def Date date = attrs.elapsed
            def Date enddate = new Date()
            if(attrs.start && attrs.end){
                date = attrs.start
                enddate = attrs.end
            }
            def Calendar cal = Calendar.getInstance()
            cal.setTime(date)
            def Calendar now = Calendar.getInstance()
            now.setTime(enddate)
            def StringBuffer val = new StringBuffer()
            def long diff = (long)Math.floor((date.getTime()-enddate.getTime()) / 1000.0)
            def long test = Math.abs(diff)
//            val << " (diff:${date.getTime()-enddate.getTime()}) "


            def s = test % 60
            def md = (test - s ).intdiv( 60 )
            def hd = md.intdiv(60)
            def m = md % 60
            def d =  hd.intdiv( 24 )
            def h = hd % 24


            if(test < 60 ){
                val << "${s}s"
            }else if(test <  (5 * 60) ){
                val <<  "${m}m"
                if(s > 0){
                    val << "${s}s"
                }
            }else if(test < (60 * 60) ){
                val <<  "${m}m"

            }else if (test < (24 * 60 * 60)){
                val << "${h}h"
                if(m > 0 ){
                    val << "${m}m"
                }
            }else{
                val << "${d}d"
                if(h > 0 ){
                    val << "${h}h"
                }
            }

            if(diff > 0 && !attrs.end && !attrs.duration){
                out << "in "
            }
            def title= attrs.end? attrs.end.toString() : date.toString()
            out << "<span class=\"${attrs.duration?(attrs.durationClass?attrs.durationClass:'duration'): diff > 0 ? (attrs.untilClass?attrs.untilClass:'until') : (attrs.agoClass?attrs.agoClass:'ago')}\" title=\"${title.encodeAsHTML()}\">"
            out << val.toString()
            out << "</span>"
            if(diff < 0 && !attrs.end && !attrs.duration){
                out << " ago"
            }
        } else {
            //do nothing.
            out << "?"
        }

    }

    
    /**
     * renders a java Date as the rfc 822 date used by RSS
     */
    def rfc822Date = {attrs,body ->
        if(attrs.date){
            SimpleDateFormat dateFormater = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'",Locale.US);
            dateFormater.setTimeZone(TimeZone.getTimeZone("GMT"));
            out<< dateFormater.format(attrs.date);
        }
    }

    /**
     * renders a java date as the W3C format used by dc:date in RSS feed
     */
    def w3cDate = {attrs,body ->
        if(attrs.date){
            SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'",Locale.US);
            dateFormater.setTimeZone(TimeZone.getTimeZone("GMT"));
            out<< dateFormater.format(attrs.date);
        }
    }


    /**
     * Escapes the HTML rendered within the tag body
     */
    def escapeHTML = { attrs, body ->
        def sw = new StringWriter()
		def saveOut = body.delegate.out
		def x = new PrintWriter(sw)
		try {
			body.delegate.out = x
            x << body()
		}
		finally {
			body.delegate.out = saveOut
		}
		out << sw.toString().encodeAsHTML()
    }

    /**
     * Conditionally renders the body content if a servletContext attribute has a specified value.
     *  Attributes: 'attribute' (name of servletcontext attribute), 'value' (value of attribute)
     */
    def ifServletContextAttribute = {attrs,body ->
        if(attrs.attribute && attrs.value){
            if(servletContext.getAttribute(attrs.attribute)==attrs.value){
                out << body()
            }
        }
    }
    /**
     * Conditionally renders the body content if a servletContext attribute exists at all.
     *  Attributes: 'attribute' (name of servletcontext attribute)
     */
    def ifServletContextAttributeExists = {attrs,body ->
        if(attrs.attribute  && servletContext.getAttribute(attrs.attribute)){
            out << body()
        }
    }

    /**
     * Output the value of a servlet context attribute.
     */
    def servletContextAttribute = {attrs,body ->
        if(attrs.attribute ){
            out << servletContext.getAttribute(attrs.attribute)
        }
    }
}
