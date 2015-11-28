#!/bin/sh -e

if who | grep -wq $USER; then
  exit
fi

MY_NUMBER = 'xxxx'
MY_BOSS   = 'xxxx'

EXCUSES = {
  '体調が良くないので'
  '風邪を引いたので'
  '気分が優れないので'
}
rand=$[ $RANDOM % ${#EXCUSES[@]} ]

RANDOM_EXCUSES=${EXCUSES[$rand]}
MESSAGE=$RANDOM_EXCUSE"自宅稼働します。"

RESPONSE=`curl -fSs -u "$TWILIO_ACCOUNT_SID:$TWILIO_AUTH_TOKEN" \
  -d "From=$MY_NUMBER" -d "To=$NUMBER_OF_BOSS" -d "Body=$MESSAGE" \
  "https://api.twilio.com/2010-04-01/Accounts/$TWILIO_ACCOUNT_SID/Messages"`

# Log errors
if [ $? -gt 0 ]; then
  echo "Failed to send SMS: $RESPONSE"
  exit 1
fi
