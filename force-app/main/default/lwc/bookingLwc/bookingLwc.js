// import { LightningElement, api } from "lwc";
// export default class BookingLwc extends LightningElement {
// 	@api recordId;
// 	@api objectApiName;
// }

import { LightningElement ,api} from 'lwc';
import bookAppointment from '@salesforce/apex/BookingLwcController.bookAppointment';
import { CloseActionScreenEvent } from 'lightning/actions'; 
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class DemoLookup extends LightningElement {
    customerSelectedRecord;
    agentSelectedRecord;
    appointmentSelectedRecord;
    communicationMethodsSelected;
    result;
    // showAppointment=false;
    handleValueSelectedOnCustomer(event) {
        this.customerSelectedRecord = event.detail;
    }
    handleValueSelectedOnAgent(event) {
        this.agentSelectedRecord = event.detail;
        // showAppointment=true;
    }
    handleValueSelectedOnAppointment(event) {
        this.appointmentSelectedRecord = event.detail;
    }
    
    handleCommunicationClick(event) {
        this.communicationMethodsSelected = event.target.label;
    }
    handleBookingClick(event) {
        bookAppointment(
            {appointmentID : this.appointmentSelectedRecord.id,
                customer:this.customerSelectedRecord.id,
                communicationMethod:this.communicationMethodsSelected}
                )
        .then(result => {
            console.log('done button');
            const toastEvent = new ShowToastEvent({
                title:'Success!',
                message:'Patient record is created Successfully!',
                variant:'success'
            });
            this.dispatchEvent(toastEvent);
        }).catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error updating record',
                    message: error.body.message,
                    variant: 'error'
                })
            );
        })
        this.dispatchEvent(new CloseActionScreenEvent());

    }
    connectedCallback() {
        console.log(' connectedCallback ');
    }
}