//This trigger code updates the seats taken and checks with the max seats.
trigger CoursesRosterTrigger on Course_Roster__c (before insert) {
    switch on trigger.operationType{
        when BEFORE_INSERT{
      
            CoursesRosterHandler.CourseAvailability(trigger.new);
         }
     }
           
}
