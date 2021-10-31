$Apps2Uninstall = @('*Office*','*todos*','*windowscommunicationsapps*','*MicrosoftTeams*','*WindowsMaps*','*BingNews*','*BingWeather*','*GetHelp*','*MixedReality*','*Getstarted*','*Microsoft3DViewer*','*MicrosoftSolitaireCollection*','*PowerAutomateDesktop*','*ScreenSketch*','*SkypeApp*','*Wallet*','*WindowsFeedbackHub*','*People*')

foreach ($Apps in $Apps2Uninstall) {
    Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -like $Apps} | Remove-AppxProvisionedPackage -Online -AllUsers
}