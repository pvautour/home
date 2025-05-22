#!/bin/bash
powershell.exe -noprofile -command Get-Clipboard | sed 's/\[006288227511_PowerUser\]/\[default\]/g' > ~/.aws/credentials
