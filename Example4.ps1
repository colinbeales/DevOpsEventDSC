#
# Example4.ps1
#
 Configuration Example4
 {
   Import-DscResource –ModuleName 'PSDesiredStateConfiguration'
 
   Node ('localhost')
   {
     #script block to download WebPI MSI from the Azure storage blob
     Script DownloadWebPIImage
     {
       GetScript = {
         @{
           Result = "WebPIInstall"
         }
       }

       TestScript = {
         Test-Path "C:\DSC\wpilauncher.exe"
       }

       SetScript ={
         $source = "http://go.microsoft.com/fwlink/?LinkId=255386"
         $destination = "C:\DSC\wpilauncher.exe"
         Invoke-WebRequest $source -OutFile $destination
       }
     }
   }
 }

Example4

# To execute
Start-DscConfiguration .\Example4 -Wait -Verbose 