#
# Example3.ps1
#
 Configuration Example3
 {
   Import-DscResource –ModuleName 'PSDesiredStateConfiguration'
 
   Node ('localhost')
   {
     WindowsFeature WebServerRole
     {
       Name = "Web-Server"
       Ensure = "Present"
     }

     WindowsFeature WebAspNet45
     {
       Name = "Web-Asp-Net45"
       Ensure = "Present"
       Source = $Source
       DependsOn = "[WindowsFeature]WebServerRole"
     }

     WindowsFeature IISConsole
     {
       Ensure = "Present"
       Name = "Web-Mgmt-Console"
       DependsOn = "[WindowsFeature]WebAspNet45"
     }	
   }
 }

Example3

# To execute
Start-DscConfiguration .\Example3 -Wait -Verbose 