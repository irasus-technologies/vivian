#!/bin/sh

echo "code,meterNumber,receiptNumber,transactionAmount,valueAmount,feeAmount,taxAmount,electricity,timestamp" > /destination/meter.csv
for file in /source/*.eml; do
	content=`tail "$file" | sed '/[?:]/d' | tr -d '\r\n' | base64 -d | sed -e 's/Thank you for using Ideal Prepaid!//g' -e 's/Product Details://g' -e 's/Meter:/,/g' -e 's/RCPT#/,/g' -e 's/Tender:/,/g' -e 's/Amt:/,/g' -e 's/*Fee:/,/g' -e 's/*Fees Taxes:/,/g' -e 's/U:/,/g' -e 's/Tender in INR//g' -e 's/T(s)//g' -e 's/kWh//g' -e '/Paid/d' | tr -d '\r\n' | sed -e 's/ ----------------------------------------//g' -e 's/----------------------------------------/\n/g'`
	filename=`echo $file | sed -e 's/\/source\/Product Delivery - _No-Reply @ Prepaid_ _noreply@trustprepaid.com_ - //g' -e 's/.eml//g'`
	echo $content,$filename >> /destination/meter.csv
done
