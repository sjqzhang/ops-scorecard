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
 * AvailabilityReceipt.java
 * 
 * User: greg
 * Created: Dec 15, 2008 5:09:15 PM
 * $Id$
 */
class AvailabilityReceipt {
        static optionals = ['comment','process']

        static constraints = {
            reporter(blank: false)
            startDate(blank: false)
            endDate(blank: false)
            service(nullable: false)
            process(nullable: true)
            level(nullable:false,range:0..100)
        }

        // basic info
        String comment
        Date startDate
        Date endDate
        User reporter
        Service service
        ServiceManagementProcess process
        int level
        Date dateCreated
    
        def beforeInsert = {
            dateCreated = new Date()
        }

   
}