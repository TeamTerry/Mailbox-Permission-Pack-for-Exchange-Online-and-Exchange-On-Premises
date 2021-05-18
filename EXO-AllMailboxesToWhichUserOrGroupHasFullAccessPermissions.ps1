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
###   Script Use - Exchange Online - List all mailboxes to which a user or email enabled security group has Full Access
###
###   Parameters will prompt for input
###   Prompt - $AliasOfMailboxOrGroup - enter the ALIAS of the mailbox that you are checking which user or email enabled security group have access


param (
    [Parameter(mandatory=$true)]
    [string] $AliasOfMailboxOrGroup
)

Get-Mailbox -ResultSize Unlimited | Get-MailboxPermission -User $AliasOfMailboxOrGroup | Select Identity,AccessRights