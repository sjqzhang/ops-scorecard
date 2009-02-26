/*
 * Copyright 2003-2008 ControlTier Software, Inc. (http://www.controltier.com)
 * All Rights Reserved.
 *
 * Licensed under the Open Software License, Version 2.1 (the "License"); you may
 * not use this file except in compliance with the License. You may obtain
 * a copy of the License at:
 *
 * http://www.controltier.com/OSL21.html
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES, either express or implied.
 * See the License for the specific language governing
 * permissions and limitations under the License.
 *
 * More information on this software can be found at: http://open.controltier.com
 *
 */
 
/*
 * ActivityController.java
 *
 * This controller shows the summary of all activity for all services,
 * and shows the activity page for a particular service.
 * 
 * User: greg
 * Created: Feb 24, 2009 10:42:42 AM
 * $Id$
 */
class ActivityController extends SecureController {
    ServiceScorecardService serviceScorecardService
    def summary = {

        Date nowDate = new Date()
        if(params.datetime){
            nowDate = new Date(params.datetime.toLong())
        }

        Calendar startCal = new GregorianCalendar()
        startCal.setTime(nowDate)
        startCal.set(Calendar.HOUR_OF_DAY,0)
        startCal.set(Calendar.MINUTE,0)
        startCal.set(Calendar.SECOND,0)
        startCal.set(Calendar.MILLISECOND,0)
        if(params.week){
            //rewind to week start as well
            def dates = serviceScorecardService.determinePreviousWeekForDatetime(nowDate.getTime())
            startCal.setTime(dates.start)
            startCal.add(Calendar.WEEK_OF_YEAR, 1)
        }


        def services = Service.listOrderByName()

        def summaryMap=[:]
        services.each{ Service svc ->
            //find proc receipts within the range for the service
            def receipts = ProcessReceipt.withCriteria
            {
                and{
                    between('actualStart', startCal.getTime(), nowDate)
                    process{
                        service {
                            eq('id',svc.id)
                        }
                    }
                }
            }
            summaryMap[svc.id]=[:]
            summaryMap[svc.id]['smActivities']=receipts.size()
            summaryMap[svc.id]['highImpact']=receipts.findAll {ProcessReceipt rec -> rec.impactLevel=='high'}.size()
            summaryMap[svc.id]['smSuccess']=receipts.findAll {ProcessReceipt rec -> rec.outcome=='successful'}.size()
            summaryMap[svc.id]['smSuccessRate']=summaryMap[svc.id]['smActivities']? summaryMap[svc.id]['smSuccess']/summaryMap[svc.id]['smActivities'] : 0 

        }
        [services:services,summaryMap:summaryMap, startDate:startCal.getTime()]
    }

    def forService = {

        def Service svc = Service.get(params.id.toLong())

        if (!svc) {
            flash.message = "Service not found with id ${params.id}"
            redirect(action: summary)
            return
        }

        System.err.println "found service: ${svc}"

        Date nowDate = new Date()
        if(params.datetime){
            nowDate = new Date(params.datetime.toLong())
        }

        Calendar startCal = new GregorianCalendar()
        startCal.setTime(nowDate)
        startCal.set(Calendar.HOUR_OF_DAY,0)
        startCal.set(Calendar.MINUTE,0)
        startCal.set(Calendar.SECOND,0)
        startCal.set(Calendar.MILLISECOND,0)
        if(params.week){
            //rewind to week start as well
            def dates = serviceScorecardService.determinePreviousWeekForDatetime(nowDate.getTime())
            startCal.setTime(dates.start)
            startCal.add(Calendar.WEEK_OF_YEAR, 1)
        }

        def processReceiptList = ProcessReceipt.withCriteria{
            and{
                between('actualStart', startCal.getTime(), nowDate)
                process{
                    service {
                        eq('id',svc.id)
                    }
                }
            }
            order('actualStart', 'desc')
        }
        def availabilityReceiptList = AvailabilityReceipt.withCriteria{
            and{
                between('startDate', startCal.getTime(), nowDate)
                service{
                    eq('id',svc.id)
                }
            }
            order('startDate', 'desc')
        }


        [processReceiptList:processReceiptList,availabilityReceiptList:availabilityReceiptList,service:svc, startDate:startCal.getTime()]
    }
}