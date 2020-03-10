#!/bin/bash
# Purpose: Creates picture of a QR code.
#  * fill in the mfa key you get from each account and run script to create QR code to import them

#aws iam resync-mfa-device --user-name Richard --serial-number arn:aws:iam::123456789012:mfa/RichardsMFA --authentication-code-1 123456 --authentication-code-2 987654

keys=(
  '' # MFA Key1 - worked
  '' # MFA Key2 - worked
  '' # MFA Key2 - worked
)

labels=(
  ''
  ''
  ''
)

type='totp' # htop || totp
issuer='aws' # 


for x in {0..4}
do
  echo "Round: ${x} - ${labels[$x]}"
  str="otpauth://${type}/${labels[$x]}?secret=${keys[$x]}&issuer=${issuer}"
  qr $str > ~/Pictures/${labels[$x]}.png
done
