#Linux notes - 
#Day 0 - Prep sesion
 \\Install Oracle Virtual Box and download Ubuntu v.22 ISO
 \\Create VM in virtualbox
  \\Setup info: Name,type,ram,virtualdisk,enable
  \\Connect Networkadapters(Nat and host-only)
  \\ sharedfolders and guest additions in vm manager
   \\snapshot clean-install
   
# Day 1 - 1st Session
 
 whoami             \\shows the current logged-in user
 uname -a           \\show the OS version of Linux
 pwd                \\the current place or directory?
 ls -la ~           \\log in info and up to date monitoring what I have check or do
 id                 \\i dont know.. 
 ps aux | head -n 10   \\its like a task manager?
 df - h              \\info of storage or memory?
 ip a                \\ its say multicast, broadcast or something..i dont know
 ping -c 3 8.8.8.8   \\ping my network to ensure it is connected to the network

        \\*One thing I struggle with / next step.
        \\-following instructions, difference between host and guest,saving file
 
 
 
 sudo                 \\sudo para mabago yung admin..kumbaga admin yung command( may power para baguhin hung system)
 sudo apt update      \\parang windows update
 
 
               \\what is git?
                 \\evidence log
 
             \\one small failure?
             \\so many command line hindi ko gets
 
             \\one immediate next step
              \\study each commands meaning



# Day 1 (2nd session) Linux-notes version 2 

*Check if Installed guest additions
*codes and verifications

cd /media/$USER/VBox_GAs*
sudo sh VBoxLinuxAdditions.run
sudo reboot


  \\if errror: bash: cd: /media/darryl/Vbox_GAs*: No such file or directory

sudo apt update
sudo apt install build-essential dkms
linux-headers-$(uname -r) -y
  \\if error:linux-headers-6.8.0-85-generic: command not found

   \\sol: apt intall linux-headers-$(uname -r) -y
   \\ then cd /media/$USER/VBox_GAs*
   \\error again: ash: cd: /media/darryl/Vbox_GAs*: No such file or directory
   \\solution: insert Guess additions image in devices menu
   \\then automatic na sya..kasi parang may nakalagay na atang guest addition sa previous session..

   \\then if goods: 
cd /media/$USER/VBox_GAs* 
sudo sh VBoxLinuxAdditions.run
sudo reboot

   \\after reboot..confirm
lsmod | grep vboxguest
    \\then okay na...


*Task 2 : Check if active yung shared folder setup and file folder

ls -la /media
ls -la /media/sf_security-lab

cp ~/Documents/linux-notes.md /media/sf_security-lab/notes/linux-notes.md 
     \\ para transfer mo files from linux to windows, linux file nga lang

     \\note: hindi ka makakapag edit ng files sa shared folder...kailangan magsave ka muna sa documents directory ng Linux bago mo maitransfer sa shared folder

  \\error: permission denied in editing files in shared folder but can save as a new file in the edited file in the shared folder
    \\ solution: Only one linux-notes for everthing.. keep editing only at documents(inside linux) or in the linux terminal
    
    \\ problem: root vboxsf ang shared folder
    \\sol: script about : sudo usermod and sudo chown
    
*Task 3: File system drill

touch ~/security-test.txt                   
mkdir ~/test-dir  
cp ~/security-test.txt ~/test-dir/
mv ~/test-dir/security-test.txt ~/test-dir/security-test-01.txt
rm ~/test-dir/security-test-01.txt
ls -l ~
chmod 700 ~/test-dir

results: success
touch  \\ create
mkdir   \\ make folder
cp       \\copy and paste
mv        \\ rename
rm        \\delete
ls -l ~    \\list all files
chmod 700 ~  \\secured folder only me access

*Task 4 - permission and small script

ls -1 ~           \\list of files and folder
stat ~         \\ status? of that folder

     \\monitoring script
     
     cat > ~/scripts/process_snapshot.sh <<'EOF'
#!/bin/bash
date +%F_%T > ~/scripts/last_run.txt
ps aux --sort=-%mem | head -n 20 > ~/scripts/process_snapshot.txt
EOF
chmod +x ~/scripts/process_snapshot.sh
~/scripts/process_snapshot.sh

   \\ error: /home/darryl/scripts/process_snapshot.sh: line 8: /home/darryl/scripts/: Is a directory
/home/darryl/scripts/process_snapshot.sh: line 9: process_snapshot.txt: command not found

   \\solution: used nano instead cat
   \\ #!/bin/bash
  # Day 1 Monitoring Script

  # Save the current date and time
 date +%F_%T > ~/scripts/last_run.txt

  # Capture the top 20 memory-using processes
 ps aux --sort=-%mem | head -n 20 > ~/scripts/process_snapshot.txt

 chmod +x ~/scripts/process_snapshot.sh
~/scripts/process_snapshot.sh
  
   \\ copy files to shared folder using cp 
   \\error: bash: /home/darryl/media/sf_security-lab/scripts/process_snapshot.sh: No such file or directory
   \\ sol: dos2unix the file , cd the shared folder in order for the .sh can be found and execute
   
   \\overwrite the linux-notes with the updated file
    \\then take snapshot
    
# Day 2 - 1st session

  








