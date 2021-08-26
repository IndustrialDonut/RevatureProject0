public class CoursesRosterHandler {
    //This code updates the seats taken and checks with the max seats.
    public static void CourseAvailability(List<Course_Roster__c> courseReg){
        List<Course__c> courseToUpdateList = new List<Course__c>();
        
        for(Course_Roster__c currReg: courseReg){
            List<Course__c> currCourse = [SELECT SeatsTaken__c, MaxSeats__c FROM Course__c WHERE Course__c.Id = :currReg.Course__c];
            
            for(Course__c c: currCourse){
                if(c.SeatsTaken__c >= c.MaxSeats__c){
                    c.addError('No seats available for the course - ' + Course__c.Name);
                }
                else{
                    c.SeatsTaken__c = c.SeatsTaken__c + 1;
                    courseToUpdateList.add(c); 
                }
            } 
            update courseToUpdateList;
        }
    }
}
