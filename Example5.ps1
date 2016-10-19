#
# Example5.ps1
#
 Configuration Example5
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
   

     Package WebPi_Installation
     {
        Ensure = "Present"
        Name = "Microsoft Web Platform Installer 5.0"
        Path = "C:\DSC\wpilauncher.exe"
        ProductId = '4D84C195-86F0-4B34-8FDE-4A17EB41306A'
        Arguments = ''
        DependsOn = @("[Script]DownloadWebPIImage")
     }
   }
 }

Example5

# To execute
Start-DscConfiguration .\Example5 -Wait -Verbose 