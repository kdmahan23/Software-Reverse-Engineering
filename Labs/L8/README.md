## Kayla Mahan
# SRE Lab 8 - Behave!
# SRE S20
------------------------------------------------
## Collaboration Statement

## Summary
The purpose of this lab was to be an introduction to behavioral analysis of malicious code.

### Tools Used
- Windows Sysinternals Suite
- Regshot
- Process Hacker
- ProcDOT
- WinDump

### Approach
The first thing I did was look at the resources given to us in the lab README and download the tools that were suggested. I didn't use all of the tools because I wasn't able to get some of them to give me information I could use to analyze. 
I opened all the tools and then ran the malware program. Once the malware was open I clicked on the various links to see where they took me or what popped up. I also used a fake login to see what would happen if I tried to actually login. 
Regshot and WinDump seemed to give me the most information about the malware. I included both output files for these two tools in my lab repo. 

### File Interactions
- Added and deleted file keys
- Modified, added, and deleted values
- Added folders
- Modified and added files

### Network Communications
I changed the file extension on the output file that WinDump gave me to put in into one of the other tools. I don't know if this is what caused the file to become unreadable, but I could not understand the information given.

### Other Useful Information
I noticed that the link to reset your password actually takes you to an actual Microsoft website to login. (I did not put in my actual credentials)
I also noticed the malware opened a webpage after you exited out of it. The first time I exited it opened what seemed to be a spam website and the second time I exited it, it opened what seemed to be an ad for anti-virus software.

## Conclusion
Messing around with malware is fun but difficult. It takes a lot of tools and a lot of time to understand all the tools and the information they can give you. 
