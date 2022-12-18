# First import the system.windows.forms assembly as an admin.
Add-Type -AssemblyName System.Windows.Forms


#Create a form
$form = New-Object System.Windows.Forms.Form


#set form properties
$form.Size = New-Object System.Drawing.Size(300,200)
$form.Text = "Create Server"
$form.StartPosition = "CenterScreen"


#add controls to the form, labels, boxes, buttons, etc.
# use the Add_Control method

$label1 = New-Object System.Windows.Forms.Label
$label1.Location = New-Object System.Drawing.Point(10,20)
$label1.Size = New-Object System.Drawing.Size(100,20)
$label1.Text = "Server Type:"

$comboBox = New-Object System.Windows.Forms.ComboBox
$comboBox.Location = New-Object System.Drawing.Point(110,20)
$comboBox.Size = New-Object System.Drawing.Size(150,20)
$comboBox.Items.AddRange(@("HTTP", "FTP", "SMTP"))

$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(10,50)
$label2.Size = New-Object System.Drawing.Size(100,20)
$label2.Text = "Port:"

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(110,50)
$textBox.Size = New-Object System.Drawing.Size(100,20)

$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(110,80)
$button.Size = New-Object System.Drawing.Size(100,20)
$button.Text = "Create Server"
$button.Add_Click({
    # Code to create the server goes here
})

$checkBox = New-Object System.Windows.Forms.CheckBox
$checkBox.Location = New-Object System.Drawing.Point(10,80)
$checkBox.Size = New-Object System.Drawing.Size(100,20)
$checkBox.Text = "Configure Firewall"
$checkBox.Add_CheckedChanged({
    # Code to configure firewall permissions goes here
})


#################################
# Creating the firewall toggle buttons for permissions
#################################

# create a panel control to hold the firewall permissions list.
$panel = New-Object System.Windows.Forms.Panel
$panel.Location = New-Object System.Drawing.Point(10,110)
$panel.Size = New-Object System.Drawing.Size(260,80)
$panel.BorderStyle = "FixedSingle"


# Create a list of firewall permissions, each with corresponding checkboxes and toggle buttons
$permissions = @(
    @{
        "Name" = "Allow Inbound ICMP"
        "CheckBox" = New-Object System.Windows.Forms.CheckBox
        "Button" = New-Object System.Windows.Forms.Button
    },
    @{
        "Name" = "Allow Inbound HTTP"
        "CheckBox" = New-Object System.Windows.Forms.CheckBox
        "Button" = New-Object System.Windows.Forms.Button
    },
    @{
        "Name" = "Allow Inbound HTTPS"
        "CheckBox" = New-Object System.Windows.Forms.CheckBox
        "Button" = New-Object System.Windows.Forms.Button
    }
)

$y = 10
foreach ($permission in $permissions) {
    $permission.CheckBox.Location = New-Object System.Drawing.Point(10,$y)
    $permission.CheckBox.Size = New-Object System.Drawing.Size(200,20)
    $permission.CheckBox.Text = $permission.Name
    $permission.Button.Location = New-Object System.Drawing.Point(220,$y)
    $permission.Button.Size = New-Object System.Drawing.Size(30,20)
    $permission.Button.Text = "On/Off"
    $permission.Button.Add_Click({
        if ($permission.CheckBox.Checked) {
            $permission.CheckBox.Checked = $false
        } else {
            $permission.CheckBox.Checked = $true
        }
    })
    $y += 30
}


# add the firewall permissions list to the panel using Add_Control method.
foreach ($permission in $permissions) {
    $panel.Controls.Add($permission.CheckBox)
    $panel.Controls.Add($permission.Button)
}


# add the panel to the form using the Add_Control method
$form.Controls.Add($panel)

# Show the form using the ShowDialog method
$form.ShowDialog()


