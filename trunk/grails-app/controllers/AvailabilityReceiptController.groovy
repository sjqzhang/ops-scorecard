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
 * AvailabilityReceiptController.java
 * 
 * User: greg
 * Created: Dec 16, 2008 9:54:29 AM
 * $Id$
 */
class AvailabilityReceiptController extends SecureController {

    def index = {redirect(action: list, params: params)}

    // the delete, save and update actions only accept POST requests
    def allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

    def list = {
       if (!params.max) params.max = 10
       if (!params.order) params.order = 'desc'
       if (!params.sort) params.sort = 'dateCreated'
        println("DEBUG: params: ${params.subMap(['sort','max','order','offset'])}")
       [availabilityReceiptList: AvailabilityReceipt.list(params)]
    }

    /**
     * action forService displays the list of avail. receipts for a particular service by id
     */
    def forService = {
        def service = Service.get(params.id.toLong())
        if (!service) {
            flash.message = "Service not found with id ${params.id}"
            redirect(action: list)
            return
        }

        if (!params.max)
            params.max = 10
        if (!params.order)
            params.order = 'desc'
        if (!params.sort)
            params.sort = 'dateCreated'
        println("DEBUG: params: ${params.subMap(['sort', 'max', 'order', 'offset'])}")
        def max = params.max.toInteger()
        def sortBy = params.sort
        def orderDir = params.order
        def offsetVal = params.offset ? params.offset.toInteger() : 0

        def availabilityReceiptList = AvailabilityReceipt.withCriteria {

            delegate.'service' {
                eq('id', service.id)
            }
            maxResults(max)
            order(sortBy, orderDir)
            firstResult(offsetVal)
        }

        render(view: 'list', model: [availabilityReceiptList: availabilityReceiptList, service: service])
    }


    def show = {
        def availabilityReceipt = AvailabilityReceipt.get(params.id)

        if (!availabilityReceipt) {
            flash.message = "AvailabilityReceipt not found with id ${params.id}"
            redirect(action: list)
        } else {
            return [availabilityReceipt: availabilityReceipt]
        }
    }
    def ajaxShow = {
        def availabilityReceipt = AvailabilityReceipt.get(params.id)

        if (!availabilityReceipt) {
            flash.message = "AvailabilityReceipt not found with id ${params.id}"
            response.setStatus(500)
            redirect(action:list)
        } else {
            render(template:'show',model:[availabilityReceipt: availabilityReceipt])
        }
    }

    def delete = {
        def availabilityReceipt = AvailabilityReceipt.get(params.id)
        if (availabilityReceipt) {
            availabilityReceipt.delete()
            flash.message = "AvailabilityReceipt ${params.id} deleted"
            redirect(action: list)
        }
        else {
            flash.message = "AvailabilityReceipt not found with id ${params.id}"
            redirect(action: list)
        }
    }

    def edit = {
        def availabilityReceipt = AvailabilityReceipt.get(params.id)

        if (!availabilityReceipt) {
            flash.message = "AvailabilityReceipt not found with id ${params.id}"
            redirect(action: list)
        }
        else {
            render(view:'edit',model:[availabilityReceipt: availabilityReceipt])
        }
    }
    def ajaxEdit = {
        def availabilityReceipt = AvailabilityReceipt.get(params.id.toInteger())

        if (!availabilityReceipt) {
            flash.message = "AvailabilityReceipt not found with id ${params.id}"
            response.setStatus(404)
            def model=list.call()
            render(template: 'list', model: model)
        }
        else {
            render(template:'form',model:[availabilityReceipt: availabilityReceipt])
        }
    }

    def update = {

            def availabilityReceipt = AvailabilityReceipt.get(params.id)

            if (availabilityReceipt) {
                availabilityReceipt.properties = params
                if (!availabilityReceipt.hasErrors() && availabilityReceipt.save()) {
                    flash.message = "AvailabilityReceipt ${params.id} updated"
                    redirect(action: list)
                } else {
                    render(view: 'edit', model: [availabilityReceipt: availabilityReceipt])
                }
            } else {
                flash.message = "AvailabilityReceipt not found with id ${params.id}"
                redirect(action: edit, id: params.id)
            }
        }
    def ajaxForm={
        render(template:'form',model:[])
    }

        def create = {
            def availabilityReceipt = new AvailabilityReceipt()
            availabilityReceipt.properties = params
            return ['availabilityReceipt': availabilityReceipt]
        }

        def save = {
            println("DEBUG: AvailabilityReceiptController#save: params=${params}")
            def availabilityReceipt
            if(params.id){
                availabilityReceipt= AvailabilityReceipt.get(params.id)
                availabilityReceipt.properties=params
            }else{
                availabilityReceipt= new AvailabilityReceipt(params)
            }

            if (!availabilityReceipt.hasErrors() && availabilityReceipt.save()) {
                flash.message = "AvailabilityReceipt ${availabilityReceipt.id} saved"
                def model=list.call(params.subMap(['sort','max','order','offset']))
                model.selected=availabilityReceipt.id
                render(view: 'list', model: model)
            }
            else {
                flash.error = "AvailabilityReceipt ${availabilityReceipt.id} has error"
                render(view: 'list', model: [availabilityReceipt: availabilityReceipt])
            }
        }

        def save_remote = {
            println("DEBUG: AvailabilityReceiptController#save: params=${params}")
            def availabilityReceipt
            if(params.id){
                availabilityReceipt= AvailabilityReceipt.get(params.id)
                availabilityReceipt.properties=params
            }else{
                availabilityReceipt= new AvailabilityReceipt(params)
            }

            if (!availabilityReceipt.hasErrors() && availabilityReceipt.save()) {
                flash.message = "AvailabilityReceipt ${availabilityReceipt.id} saved"
                def model=params.showpage?show.call(params):list.call(params.subMap(['sort','max','order','offset']))
                model.selected=availabilityReceipt.id
                model.availabilityReceipt=availabilityReceipt
                render(template: params?.showpage?'show':'list', model: model)
            }
            else {
                flash.message = "Cannot save receipt, please check the form fields"
                response.setStatus(500)
                def model=list.call(params.subMap(['sort','max','order','offset']))
                model.availabilityReceipt= availabilityReceipt
                render(template: params?.showpage?'show':'list', model: model)
            }
        }

        def search = {
            def criteria = AvailabilityReceipt.createCriteria()
            def results = criteria.list {
                service {
                    type {
                        ilike('name', params.serviceType)
                    }
                }
            }
            render(view: 'search', model: [availabilityReceiptList: results])
        }

}