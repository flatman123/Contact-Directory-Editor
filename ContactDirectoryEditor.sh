#! /bin/bash

# THIS SCRIPT WILL BE USED TO DOWNLOAD, EDIT, THEN RE-UPLOAD POLYCOM CONTACT-DIRECTORY FILES TO FTP-Server

function editXMLfile() {
# This function opens a separate window for you to edit the default xml file.
  gnome-terminal --window  vi 000000000000-directory.xml
	exit 0
}


function getCredentials() {
# This will ask the user for their Credentials to get into the FTP server
  read -p "whats your  ftp username? " username
  read -sp "whats you  ftp password? " password
	exit 0
}


function uploadFiles() {
# This function will upload the *updated* xml-Directory files to the FTP server
  getCredentials
  read -p " Will you be uploading files to '$File'?(y/n) " answer
  case $answer in
    [yY])
      ncftpput -R -v -u $username -p $password <your FTP IP Address> .*xml /$default/
    ;;
    [nN])
      read -p "Ok then enter a different customer Folder: " newFolder
      ncftpput -R -v -u $username -p $password <your FTP IP Address> .*xml /$newFolder/
    ;;
  esac
	exit 0
}


function duplicateFiles() {
#This copies the contents from a source-file to all the xml files downloaded from FTP
  read -p "Enter the file to copy from.Please enter the full name with file extension: " default

  xmlfile=$(ls *.xml)
  for File in $xmlfile;
  do
    if [ $File == $default ]; then
    continue
    else
      echo " attempting to copy '$default' to '$File... "
      sleep 1
      cp $default $File#! /bin/bash#! /bin/bash


# THIS SCRIPT WILL BE USED TO DOWNLOAD, EDIT, THEN RE-UPLOAD POLYCOM CONTACT-DIRECTORY FILES TO FTP-Server

function editXMLfile() {
# This function opens a separate window for you to edit the default xml file.
  #gnome-terminal --window  vi 000000000000-directory.xml

  #OPENS SUBLIMe EDITOR to edit the file
  subl 000000000000-directory.xml
}


function getCredentials() {
# This will ask the user for their Credentials to get into the FTP server
  read -p "whats your  ftp username? " username
  read -sp "whats you  ftp password? " password
	
}


function uploadFiles() {
# This function will upload the *updated* xml-Directory files to the FTP server
  getCredentials
  read -p " Will you be uploading files to '$customer'?(y/n) " answer
  case $answer in
    [yY])
      ncftpput -R -v -u $username -p $password 162.212.4.53 /$customer/ *xml 
    ;;
    [nN])
      read -p "Ok then enter a different customer Folder: " newFolder
      ncftpput -R -v -u $username -p $password <your FTP IP Address> .*xml /$newFolder/
    ;;
  esac
}


function duplicateFiles() {
#This copies the contents from a source-file to all the xml files downloaded from FTP
  read -p "Enter the file to copy from.Please enter the full name with file extension: " default

  xmlfile=$(ls *.xml)
  for File in $xmlfile;
  do
    if [ $File == $default ]; then
    continue
    else
      echo " attempting to copy '$default' to '$File... "
      sleep 1
      cp $default $File
    fi
    if [ $? -eq 0 ]; then echo " '$File' updated"; else exit 2; fi
  done
}

function removeFiles() {
	rm *.xml
}


function run() {
#This logs in and downloads the xml files from customer's ftp folder.
  getCredentials
  read -p "What customer Folder you want to copy? " customer

  ncftpget -R -v -u $username -p $password 162.212.4.53 . ./$customer/*xml
  if [ $? -ne 0 ]; then
    exit 127
  else
    editXMLfile
    read -p " Please locate and  Edit the default '000000000000-directory.xml' before we proceed. Hit enter in this window once completed..." hitEnter
  duplicateFiles
  uploadFiles
  removeFiles
  fi
	exit 0
}

run


# THIS SCRIPT WILL BE USED TO DOWNLOAD, EDIT, THEN RE-UPLOAD POLYCOM CONTACT-DIRECTORY FILES TO FTP-Server

function editXMLfile() {
# This function opens a separate window for you to edit the default xml file.
  gnome-terminal --window  vi 000000000000-directory.xml
}


function getCredentials() {
# This will ask the user for their Credentials to get into the FTP server
  read -p "whats your  ftp username? " username
  read -sp "whats you  ftp password? " password
	
}


function uploadFiles() {
# This function will upload the *updated* xml-Directory files to the FTP server
  getCredentials
  read -p " Will you be uploading files to '$customer'?(y/n) " answer
  case $answer in
    [yY])
      ncftpput -R -v -u $username -p $password <IP-ADDRESS> /$customer/ *xml 
    ;;
    [nN])
      read -p "Ok then enter a different customer Folder: " newFolder
      ncftpput -R -v -u $username -p $password <your FTP IP Address> .*xml /$newFolder/
    ;;
  esac
}


function duplicateFiles() {
#This copies the contents from a source-file to all the xml files downloaded from FTP
  read -p "Enter the file to copy from.Please enter the full name with file extension: " default

  xmlfile=$(ls *.xml)
  for File in $xmlfile;
  do
    if [ $File == $default ]; then
    continue
    else
      echo " attempting to copy '$default' to '$File... "
      sleep 1
      cp $default $File
    fi
    if [ $? -eq 0 ]; then echo " '$File' updated"; else exit 2; fi
  done
}

function removeFiles() {
	rm *.xml
}

function run() {
#This logs in and downloads the xml files from customer's ftp folder.
  getCredentials
  read -p "What customer Folder you want to copy? " customer

  ncftpget -R -v -u $username -p $password <IP-ADDRESS> . ./$customer/*xml
  if [ $? -ne 0 ]; then
    exit 127
  else
    editXMLfile
    read -p " Please locate and  Edit the default '000000000000-directory.xml' before we proceed. Hit enter in this window once completed..." hitEnter
  duplicateFiles
  uploadFiles
  removeFiles
  fi
	exit 0
}

run
    fi
    if [ $? -eq 0 ]; then echo " '$File' updated"; else exit 2; fi
  done
	exit 0
}


function dnloadXMLfiles() {
#This logs in and downloads the xml files from customer's ftp folder.
  getCredentials
  read -p "What customer Folder you want to copy? " customer
  ncftpget -R -v -u $username -p $password <your FTP IP Address> . /$customer/*xml
  if [ $? -ne 0 ]; then
    exit 127
  else
    editXMLfile
    read -p " Please locate and  Edit the default '000000000000-directory.xml' before we proceed. Hit enter in this window once completed..." hitEnter
  duplicateFiles
  uploadFiles
  fi
	exit 0
}
#! /bin/bash


# THIS SCRIPT WILL BE USED TO DOWNLOAD, EDIT, THEN RE-UPLOAD POLYCOM CONTACT-DIRECTORY FILES TO FTP-Server

function editXMLfile() {
# This function opens a separate window for you to edit the default xml file.
  gnome-terminal --window  vi 000000000000-directory.xml
}


function getCredentials() {
# This will ask the user for their Credentials to get into the FTP server
  read -p "whats your  ftp username? " username
  read -sp "whats you  ftp password? " password
	
}


function uploadFiles() {
# This function will upload the *updated* xml-Directory files to the FTP server
  getCredentials
  read -p " Will you be uploading files to '$customer'?(y/n) " answer
  case $answer in
    [yY])
      ncftpput -R -v -u $username -p $password <IP-ADDRESS> /$customer/ *xml 
    ;;
    [nN])
      read -p "Ok then enter a different customer Folder: " newFolder
      ncftpput -R -v -u $username -p $password <your FTP IP Address> .*xml /$newFolder/
    ;;
  esac
}


function duplicateFiles() {
#This copies the contents from a source-file to all the xml files downloaded from FTP
  read -p "Enter the file to copy from.Please enter the full name with file extension: " default

  xmlfile=$(ls *.xml)
  for File in $xmlfile;
  do
    if [ $File == $default ]; then
    continue
    else
      echo " attempting to copy '$default' to '$File... "
      sleep 1
      cp $default $File
    fi
    if [ $? -eq 0 ]; then echo " '$File' updated"; else exit 2; fi
  done
}


function run() {
#This logs in and downloads the xml files from customer's ftp folder.
  getCredentials
  read -p "What customer Folder you want to copy? " customer

  ncftpget -R -v -u $username -p $password <IP-ADDRESS> . ./$customer/*xml
  if [ $? -ne 0 ]; then
    exit 127
  else
    editXMLfile
    read -p " Please locate and  Edit the default '000000000000-directory.xml' before we proceed. Hit enter in this window once completed..." hitEnter
  duplicateFiles
  uploadFiles
  fi
	exit 0
}

run
#! /bin/bash


# THIS SCRIPT WILL BE USED TO DOWNLOAD, EDIT, THEN RE-UPLOAD POLYCOM CONTACT-DIRECTORY FILES TO FTP-Server

function editXMLfile() {
# This function opens a separate window for you to edit the default xml file.
  gnome-terminal --window  vi 000000000000-directory.xml
}


function getCredentials() {
# This will ask the user for their Credentials to get into the FTP server
  read -p "whats your  ftp username? " username
  read -sp "whats you  ftp password? " password
	
}


function uploadFiles() {
# This function will upload the *updated* xml-Directory files to the FTP server
  getCredentials
  read -p " Will you be uploading files to '$customer'?(y/n) " answer
  case $answer in
    [yY])
      ncftpput -R -v -u $username -p $password <IP-ADDRESS> /$customer/ *xml 
    ;;
    [nN])
      read -p "Ok then enter a different customer Folder: " newFolder
      ncftpput -R -v -u $username -p $password <your FTP IP Address> .*xml /$newFolder/
    ;;
  esac
}


function duplicateFiles() {
#This copies the contents from a source-file to all the xml files downloaded from FTP
  read -p "Enter the file to copy from.Please enter the full name with file extension: " default

  xmlfile=$(ls *.xml)
  for File in $xmlfile;
  do
    if [ $File == $default ]; then
    continue
    else
      echo " attempting to copy '$default' to '$File... "
      sleep 1
      cp $default $File
    fi
    if [ $? -eq 0 ]; then echo " '$File' updated"; else exit 2; fi
  done
}

function removeFiles() {
	rm *.xml
}


function run() {
#This logs in and downloads the xml files from customer's ftp folder.
  getCredentials
  read -p "What customer Folder you want to copy? " customer

  ncftpget -R -v -u $username -p $password <IP-ADDRESS> . ./$customer/*xml
  if [ $? -ne 0 ]; then
    exit 127
  else
    editXMLfile
    read -p " Please locate and  Edit the default '000000000000-directory.xml' before we proceed. Hit enter in this window once completed..." hitEnter
  duplicateFiles
  uploadFiles
  removeFiles
  fi
	exit 0
}

run
