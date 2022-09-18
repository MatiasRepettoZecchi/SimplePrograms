Public Class Form1
    Public filepath As String
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim pathname As String = TextBox1.Text
        Dim foldername As String = TextBox2.Text
        Dim command As String = "cd " + pathname + " & md " + foldername + " & cd " + foldername + " & md greenscreen depth normal & cd.. & move greenscreen* " + foldername + "/greenscreen & move depth* " + foldername + "/depth & move normal* " + foldername + "/normal & exit"
        Shell("cmd.exe /k" + command)
		Shell("cmd.exe /k" + "msg %username% Folder created sucessfully & exit")

    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim dialog As New FolderBrowserDialog()
        dialog.RootFolder = Environment.SpecialFolder.Desktop
        dialog.SelectedPath = "C:\"
        dialog.Description = "Select Application Configeration Files Path"
        If dialog.ShowDialog() = Windows.Forms.DialogResult.OK Then
            filepath = dialog.SelectedPath
        End If
        TextBox1.Text = filepath
    End Sub
End Class
