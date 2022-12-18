# Create a pop-up window to input search term
$searchTerm = Read-Host "Enter search term"

# Search the entire directory for the search term
$results = Get-ChildItem -Recurse | Select-String -Pattern $searchTerm

# Output the results to a plain text file
$results | Out-File -FilePath C:\results.txt
