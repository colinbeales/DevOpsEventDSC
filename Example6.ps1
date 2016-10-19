#
# Example6.ps1 - Show http://www.powershellgallery.com
#
# Install-Module -Name xWebAdministration 

 Configuration Example6
 {
   Import-DscResource –ModuleName PSDesiredStateConfiguration, xWebAdministration
   
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

     xWebsite FabrikamWebSite
     {
       Ensure = "Present"
       Name = "MyWebsite"
       State = "Started"
       PhysicalPath = "C:\DSC"
       BindingInfo = MSFT_xWebBindingInformation 
       {
         Protocol = "HTTP"
         Port = "81"
       } 
       DependsOn = "[WindowsFeature]IISConsole"
     }
   }
 }


Example6

# To execute
Start-DscConfiguration .\Example6 -Wait -Verbose 