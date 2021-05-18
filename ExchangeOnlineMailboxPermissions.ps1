##################################################################################################################################################
###                                                                                                                                            ###
###  	Script by Terry Munro -                                                                                                                ###
###     Technical Blog -               http://365admin.com.au                                                                                  ###
###     Webpage -                      https://www.linkedin.com/in/terry-munro/                                                                ###
###     GitHub Scripts -               https://github.com/TeamTerry                                                                            ###
###                                                                                                                                            ###
###     GitHub Download link -         https://github.com/TeamTerry/Mailbox-Permission-Pack-for-Exchange-Online-and-Exchange-On-Premises       ###
###                                                                                                                                            ###
###     Support -                      http://www.365admin.com.au/2018/01/powershell-scripts-to-report-on-mailbox.html                         ###
###                                                                                                                                            ###
###     Version 1.0 - 03/01/2018                                                                                                               ### 
###                                                                                                                                            ###
###                                                                                                                                            ###
##################################################################################################################################################

###   Notes
###
###   Script Use - Exchange Online - Generate reports on ALL mailboxes with Full Access, Send As, Send on Behalf permissions and who has that permission
###


########################################################

$Mailboxes = get-mailbox -ResultSize Unlimited

$logpath = "c:\reports"

########################################################


Get-RecipientPermission | Where {($_.Trustee -ne 'nt authority\self') -and ($_.Trustee -ne 'Null sid')} | select Identity, Trustee, AccessRights | Export-Csv -NoTypeInformation "$logpath\MailboxSendAsAccess-EXOnline.csv"

$Mailboxes |  ? {$_.GrantSendOnBehalfTo -ne $null} | select Name,Alias,UserPrincipalName,PrimarySmtpAddress,GrantSendOnBehalfTo | export-csv -NoTypeInformation "$logpath\MailboxSendOnBehalfAccess-EXOnline.csv"

$Mailboxes | Get-MailboxPermission | Where { ($_.IsInherited -eq $False) -and -not ($_.User -like “NT AUTHORITY\SELF”) -and -not ($_.User -like '*Discovery Management*') } | Select Identity, user | Export-Csv -NoTypeInformation "$logpath\MailboxFullAccess-EXOnline.csv"

