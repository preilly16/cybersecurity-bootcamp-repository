#Requires -RunAsAdministrator
$documents = [Environment]::GetFolderPath('mydocuments') 
$cheatpath = Join-Path $documents "/cheat"
$configpath = Join-Path $cheatpath "/.config"
$sheetpath = Join-Path $cheatpath "/cheetsheets"
$communitypath = Join-Path $sheetpath "/community"
$securitypath = Join-Path $sheetpath "/security"
$classpath = Join-Path $psscriptroot "/cheatsheets"
$personalpath = Join-Path $sheetpath "/personal"
$cheat = Join-Path $psscriptroot "/cheat.exe"
$conffile = Join-Path $configpath "/conf.yml"

#Check for Cheat folders and create if they do not exist.
if(!(Test-Path $cheatpath)){ New-Item -ItemType Directory -path $cheatpath }
if(!(Test-Path $configpath)){ New-Item -ItemType Directory -path $configpath }
if(!(Test-Path $sheetpath)){ New-Item -ItemType Directory -path $sheetpath }
if(!(Test-Path $communitypath)){ New-Item -ItemType Directory -path $communitypath }
if(!(Test-Path $securitypath)){ New-Item -ItemType Directory -path $securitypath }
if(!(Test-Path $personalpath)){ New-Item -ItemType Directory -path $personalpath }

Copy-Item -Path $cheat -Destination $cheatpath

git clone https://github.com/cheat/cheatsheets $communitypath
git clone https://github.com/andrewjkerr/security-cheatsheets $securitypath


$cheatconfig = @"
---
# The editor to use with 'cheat -e <sheet>'. Defaults to `$EDITOR or `$VISUAL.
editor: code

# Should 'cheat' always colorize output?
colorize: true

# Which 'chroma' colorscheme should be applied to the output?
# Options are available here:
#   https://github.com/alecthomas/chroma/tree/master/styles
style: monokai

# Which 'chroma' "formatter" should be applied?        
# One of: "terminal", "terminal256", "terminal16m"     
formatter: terminal16m

# The paths at which cheatsheets are available. Tags associated with a cheatpath
# are automatically attached to all cheatsheets residing on that path.
#
# Whenever cheatsheets share the same title (like 'tar'), the most local
# cheatsheets (those which come later in this file) take precedent over the
# less local sheets. This allows you to create your own "overides" for
# "upstream" cheatsheets.
#
# But what if you want to view the "upstream" cheatsheets instead of your own?
# Cheatsheets may be filtered via 'cheat -t <tag>' in combination with other
# commands. So, if you want to view the 'tar' cheatsheet that is tagged as
# 'community' rather than your own, you can use: cheat tar -t community
cheatpaths:

  # Paths that come earlier are considered to be the most "global", and will
  # thus be overridden by more local cheatsheets. That being the case, you
  # should probably list community cheatsheets first.  
  #
  # Note that the paths and tags listed below are placeholders. You may freely
  # change them to suit your needs.
  #
  # Community cheatsheets must be installed separately, though you may have
  # downloaded them automatically when installing 'cheat'. If not, you may
  # download them here:
  #
  # https://github.com/cheat/cheatsheets
  #
  # Once downloaded, ensure that 'path' below points to the location at which
  # you downloaded the community cheatsheets.
  - name: community
    path: $communitypath
    tags: [ community ]
    readonly: true

  # Class Cheat Sheets will take precedence over community sheets but not personal.
  - name: security
    path: $securitypath
    tags: [ security ]
    readonly: true

  # Class Cheat Sheets will take precedence over community sheets but not personal.
  - name: class
    path: $classpath
    tags: [ class ]
    readonly: true

  # If you have personalized cheatsheets, list them last. They will take
  # precedence over the more global cheatsheets.       
  - name: personal
    path: $personalpath
    tags: [ personal ]
    readonly: false

  # While it requires no configuration here, it's also worth noting that
  # 'cheat' will automatically append directories named '.cheat' within the
  # current working directory to the 'cheatpath'. This can be very useful if
  # you'd like to closely associate cheatsheets with, for example, a directory
  # containing source code.
  #
  # Such "directory-scoped" cheatsheets will be treated as the most "local"
  # cheatsheets, and will override less "local" cheatsheets. Likewise,
  # directory-scoped cheatsheets will always be editable ('readonly: false').
"@

Set-Content -Path $conffile -Value $cheatconfig

# Add Cheat to Path
$pathobject = [Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::Machine)
$newpath = '{0}{1}{2}' -f $pathobject,[IO.Path]::PathSeparator,$cheatpath

[Environment]::SetEnvironmentVariable('Path', $newpath, [System.EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable('CHEAT_CONFIG_PATH', $conffile, [System.EnvironmentVariableTarget]::Machine)


Write-Host "You must Restart VSCode to be able to start using the cheat command."