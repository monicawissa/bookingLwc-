//Invocation class for About Expire Batch Class

//public with sharing class InvokingBookingBatch {
public class InvokingBookingBatch implements Schedulable {
    //this function used to the Schedulable task 
    public void execute(SchedulableContext sc) {
        System.debug('# InvokingBookingBatch - Start');
        //Define the About Expire Batch 
        BookingBatch BookingBatch = new BookingBatch();
        //Execute About Expire Batch
        Database.executeBatch(BookingBatch, 1);
        // // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        // String sch = '0 0 13 * *'; // every day at 1PM
        // String jobID = System.schedule('Remind Opp Owners', sch, reminder);
    }
    //this function used to the Schedulable task 
    //public void InvokingBookingBatch() {

        //System.debug('# InvokingBookingBatch - Start');
        //Define the About Expire Batch 
        //BookingBatch BookingBatch = new BookingBatch();
        //Execute About Expire Batch
        //Database.executeBatch(BookingBatch, 4);
    //}
}
// InvokingBookingBatch reminder = new InvokingBookingBatch();
// // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
// String sch = '0 15 12 * * ?';
// String jobID = System.schedule('Booking job', sch, reminder);