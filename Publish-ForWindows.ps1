Get-Process -Name dnscrypt-proxy,fastgithub | Stop-Process -Force -v
Set-Location $PSScriptRoot
$Output = Join-Path -Path $PSScriptRoot -ChildPath Publish
Get-ChildItem $Output -Recurse | Remove-Item -Force -v
$PublishOutput = Join-Path -Path $Output -ChildPath fastgithub_win-x64
dotnet publish -c Release -o $PublishOutput ./FastGithub.UI/FastGithub.UI.csproj
dotnet publish -c Release /p:PublishSingleFile=true /p:PublishTrimmed=true --self-contained -r win-x64 -o $PublishOutput ./FastGithub/FastGithub.csproj