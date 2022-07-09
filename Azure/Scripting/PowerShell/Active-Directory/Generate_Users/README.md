## 👤 Generate Users
A script that automates Active Directory user creation from a list of names. Creates an OU with the name `New Users` and sets each username to the initial of the first name followed by the surname. Each password is set to `!password1`.

For example, the name "John Smith" creates an account with the credentials:
- Name: `John Smith`
- Username: `jsmith`
- Password: `!password1`

This was written as part of a [blog post](https://tarranprior.com/writing/active-directory-homelab-using-virtualisation-powershell-automation) demonstrating how to setup and automate an active directory home lab for security research purposes.

### Usage
1. Clone both files into a directory of your choice.

   ```
   git clone https://tarranprior.com/tarranprior/active-directory-powershell/blob/main/AD-Generate_Users
   ```
2. Launch PowerShell ISE with administrator privileges and *File > Open* the script.
3. Set PowerShell's execution policy to unrestricted by running the following:

   ```
   Set-ExecutionPolicy Unrestricted
   ```
4. Change PowerShell's directory to where you downloaded the files. (Namely `./names.txt`.)

   ```
   cd "C:/Users/User/Documents/AD-Generate_Users"
   ```
5. ▶️ Run the script.

### Names
The names in `names.txt` have been randomly generated using Python and some 📜 [Wordlists](https://github.com/tarranprior/Wordlists).