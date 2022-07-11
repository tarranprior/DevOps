## 👤 Create_Users (.csv)
A script that automates Active Directory user creation from a spreadsheet of names/offices. Creates a parent OU with the name `New Employees`, groups for each office, and then creates and adds each user to their respective group.

Usernames are set to the initial of the first name followed by the surname. Each password is set to `!password1`.

For example, the name "John Smith" creates an account with the credentials:
- **Name**: John Smith
- **Username**: jsmith
- **Password**: !password1

This was written as part of a [blog post](http://tarranprior.com/writing/aduser-automate-active-directory-user-operations-using-powershell).

### Usage
1. Clone both files into a directory of your choice.

   ```
   git clone https://github.com/tarranprior/DevOps/Azure/Scripting/PowerShell/Active-Directory/Create_Users_From_CSV.git
   ```
2. Launch PowerShell ISE with administrator privileges and *File > Open* the script.
3. Set PowerShell's execution policy to unrestricted by running the following:

   ```
   Set-ExecutionPolicy Unrestricted
   ```
4. Change PowerShell's directory to where you downloaded the files. (Namely `./Employees.csv`.)

   ```
   cd "C:/Users/User/Documents/Create_Users_From_CSV/"
   ```
5. ▶️ Run the script.

### Employees
The names/offices in `Employees.csv` have been randomly generated using Python and some 📜 [Wordlists](https://github.com/tarranprior/Wordlists).