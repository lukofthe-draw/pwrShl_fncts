# Powershell script to start and stop services

# Create a form to display the text box
$form = New-Object System.Windows.Forms.Form
$form.Text = "Service Control"
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = "CenterScreen"

# Create a label for the form
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = "Enter the name of the service to start or stop:"
$form.Controls.Add($label)

# Create a text box for the form
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,50)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

# Create a start button for the form
$startButton = New-Object System.Windows.Forms.Button
$startButton.Location = New-Object System.Drawing.Point(10,80)
$startButton.Size = New-Object System.Drawing.Size(75,23)
$startButton.Text = "Start"
$startButton.Add_Click({
    # Start the service when the button is clicked
    Start-Service -Name $textBox.Text
})
$form.Controls.Add($startButton)

# Create a stop button for the form
$stopButton = New-Object System.Windows.Forms.Button
$stopButton.Location = New-Object System.Drawing.Point(95,80)
$stopButton.Size = New-Object System.Drawing.Size(75,23)
$stopButton.Text = "Stop"
$stopButton.Add_Click({
    # Stop the service when the button is clicked
    Stop-Service -Name $textBox.Text
})
$form.Controls.Add($stopButton)

# Display the form
$form.ShowDialog()
