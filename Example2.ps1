#
# Example2.ps1
#
 Configuration Example2
 {
   Import-DscResource –ModuleName 'PSDesiredStateConfiguration'
 
   Node ('localhost')
   {
     WindowsFeature WebServerRole
     {
        Name = "Web-Server"
        Ensure = "Present"
     }
   }
 }

Example2

# To execute
Start-DscConfiguration .\Example2 -Wait -Verbose 