#
# Example1.ps1
#
 Configuration Example1
 {
   Import-DscResource –ModuleName 'PSDesiredStateConfiguration'
 
   Node ('localhost')
   {
      File CopyDeploymentBits
      {
        Ensure = "Present"
	Type = "Directory"
	Recurse = $true
	SourcePath = "C:\DSC"
	DestinationPath = "C:\destination"
      }
   }
 }

Example1

# To execute
Start-DscConfiguration .\Example1 -Wait -Verbose 