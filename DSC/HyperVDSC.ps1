Configuration HyperV{

Import-DscResource -ModuleName PsDesiredStateConfiguration

Node MSKEY-ASUS{  
    WindowsFeature HyperV {

        Ensure = "Present"
        Name = "Hyper-V"
        IncludeAllSubFeature = $true
        }
    }
}

HyperV -OutputPath C:\Users\mattskey\OneDrive\DEV\REPO\DSC\CONFIGS