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
 * PageController.java
 * 
 * User: greg
 * Created: Jan 21, 2009 9:54:19 AM
 * $Id$
 */
class PageController extends SecureController{
    def index = {
        def servcount = Service.count()
        if(servcount>0){
            redirect(controller:'serviceScorecard',action:'index')
        }
    }
}