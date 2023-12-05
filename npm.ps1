# Define the version and architecture
$version = "v18.12.0"
$architecture = "win-x64"

# Define the download URL
$url = "https://nodejs.org/dist/$version/node-$version-$architecture.zip"

# Define the path to save the file
$outfile = "$HOME\node-$version-$architecture.zip"

# Download Node.js
Invoke-WebRequest -Uri $url -OutFile $outfile

# Extract Node.js
Expand-Archive -Path $outfile -DestinationPath $HOME

# Add Node.js to the PATH
$env:Path += ";$HOME\node-$version-$architecture"

# Save the updated PATH to the user environment variables
[System.Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::User)