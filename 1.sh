#!/bin/bash
# eval `ssh-agent -s`
git pull
: > ebay-usItemId.txt
: > ebay-currentPrice.txt
: > ebay-wasPrice.txt
: > ebay-availabilityStatus.txt

while read line
do
  array=(${line//|/ })
  while true
  do
    list=`curl -s 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22'${array[1]}'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A1%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%2C%22permission%22%3A%22VIEW%22%7D%7D' \
  -H 'authority: www.walmart.com' \
  -H 'cookie: vtc=ZV4XF19kqR87hp6NvYWKOU; _m=9; _pxvid=b53b4e32-559d-11ed-b409-654a64435159; dimensionData=945; g=1; _sp_id.ad94=7e93d7be-379a-4c09-b03d-8602e64d9df1.1672191400.2.1680338260.1672191401.c2cfe04a-7222-4c56-9d33-05312067970c; abqme=true; _pxhd=bf8d63c794f7086339958e68548ab23a092ec2021c963c5ecc12453ce2386607:b53b4e32-559d-11ed-b409-b1f43a4e2b7f; TBV=7; akehab=ipctrl; userAppVersion=main-1.82.1-68a152-0628T2056; sod=torbit1688246583; hasLocData=1; bstc=cumQWvRYwD--hBTHa-V-lU; mobileweb=0; xpth=x-o-mart%2BB2C~x-o-mverified%2Bfalse; _astc=c9d3cd08460bf6daf2d5b8b18a6d3aa9; hasACID=true; assortmentStoreId=3081; ACID=73c6d16e-43ae-4979-a706-187d831c76f9; xpa=0Iadf|0KA3-|0uTG6|2NYvd|3K-KJ|5M-UN|5e9Fg|8cYMq|8oGja|9-5I8|BukPC|CMCyD|DcdL-|FjLG1|GycPV|IRAHO|IhmrE|KvYZX|N0ixq|O4zXd|OFXXb|OpwGp|S7lM8|SoVwe|TWhvb|U3NAT|VDAFc|YnYws|ZgSVh|_NzN8|_uNDy|a_rrh|dayNl|gjQMr|jyp9o|kJc_t|pcXyb|qkVpx|u2iCd|vK1I8|wXvq0|xTsTj|zW-ys; exp-ck=0Iadf10uTG615M-UN18cYMq19-5I81BukPC1CMCyD1FjLG11GycPV1IRAHO1KvYZX1O4zXd1TWhvb1VDAFc1YnYws4ZgSVh1_NzN81_uNDy1a_rrh2kJc_t1pcXyb1qkVpx1u2iCd1vK1I81zW-ys1; xptc=assortmentStoreId%2B3081; adblocked=true; akavpau_p2=1688459616~id=d8f718f85e7f540107adfb221c0a999e; bm_mi=BA00D8D7185E1D608372396088052474~YAAQlAqrcUVQ1B+JAQAA/3wBIBSbmwssZDG+eB1QkONRkM7bqWXjYjySDpawxejeGpf5ygwLzpmk3Vy+HfjexzQgdBfL7zo4nHqWk3k4rFyfYCwzULd8X2wRR8vo9AEDQNBiqgzbci79lIGm4wBSm/NyUywl9fmoC7+rJcQiASWgvfYY9XyaOmXzFh1rlqGwhSUxTRWIwptUmbaoevmpHEEJ6H6sk6SBMQIltnV2WknArC8cQN/1g28Bw3nq9SlBC0m5OiCzdnIZ+uL94/jQLQYR369J/dvnLey0j6wBMODMBh1/GPBY70TMDRJD2fR33MUnHeGWYj12LmXa34LU84CJlaBIiLuq+uUZp0xGlsbkbu5bJ0ak7WpANdvxlfpXhnEk~1; bm_sv=B1DAFB01961E6B57DD4D4C642DF49638~YAAQlAqrcStR1B+JAQAAC7YBIBTD6SxeyPz9aU7ZdvyC5zrrfmgo1fSKSH3NfdJKys0W8R7AC4YxpgGL4Nm9qx0R+8NGICmRRNX+9yd76ELu6VEGrCtgGFuraAhkx6r5GT/0ZR6dDmtL8nvoe7EMg/N0T9wlwPoRXPz6ChvVOvB8u6KBUfPRQIOnuJAmPhuehD5UNuHQZvg3x/WGmumKjVXkoD1REXlMj2i071+8TZ5ycpsdi//xooagAyHSZAjsEBs=~1; ak_bmsc=4DE08386B098AB9379D9495D0F76A2E5~000000000000000000000000000000~YAAQlAqrcdRR1B+JAQAAbNUBIBSdpsYvAjmNKjXaQsVjZeZ3hFZsObeL/mDPXYBtzKe9qtrFw+wZiOzfz6DG/oBWE7j1u9R5gI9bD1Isj1AW1lR+FplAKCIaHyHz/BVfZZcI7dz10c77jeDynnaSZKvFUGY1sFE8iUGatEPSTJUVBccE+WzC8voNRl1q4IxA9jpJWOgtJFSU1qM5CykopL04Szt2wydaMT6GJN+uilX1h++/3D2rSmSAqd3J4sN9oxBHn74mk0/R0hpXDDLW60fHZggGxG/ZdH1a1qepAq0zfJSMq7mwmJ/70WLSVIgoTkvlMIaNDjaj0906LVLkVyx3Kv7QogoOi7L5TCD2vLppbnXTwJZDJZboqjv/aFw0n5w8hxRSHNdhPW/TAFl4oakRsenIpmgGxy1Ol9vN+eAvx/5aJHk3CizJxP65jtHab+rnq/LxUmmeONNH4hY0b/mLEk1Rb4pvWp8wg3NZFm0y8Yv10Q==; AID=wmlspartner%3D0%3Areflectorid%3D0000000000000000000000%3Alastupd%3D1688459160959; auth=MTAyOTYyMDE4YebgTKpaBg%2FgJjZIK0NdBvdFXCcZAVtcM5yo9sDpvUmEY899US54XB6i2U4l7qnb2VL8Xy9LG7L4PfYzfkI57hJB%2Foqseho%2FHvbBuUmIU5sDh%2BgnQfT0d0cKwwJEgo%2FM767wuZloTfhm7Wk2KcjygkeeSCv4Chv5IarMOQ7pqjet%2BhksjFayEeJNMdRyNi32zrG6L%2BCAjUVZ%2FI6DCxMke3INqYHNCsZv6jHGG7ixf2YUMk70P8glgOEpLOprhDfMDCcb9mgycy9jtT1uIyOBHRIVpi42a8UFdwgNpYUAMqtKnKJ%2FqcX5sRloGT7yl1Zkz5XDKOrD7WEGaEHgOibkLynqMcdy1TmLITt6%2FR0aRfBanSNb9HJRi1lS%2BTgQdPxAFJ1diLoi4%2BCIXCtR%2BXzQ8EjyrOXbKKhH072NS%2FW0j%2FU%3D; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsImlzRXhwbGljaXQiOmZhbHNlLCJzdG9yZUludGVudCI6IlBJQ0tVUCIsIm1lcmdlRmxhZyI6ZmFsc2UsImlzRGVmYXVsdGVkIjp0cnVlLCJwaWNrdXAiOnsibm9kZUlkIjoiMzA4MSIsInRpbWVzdGFtcCI6MTY4ODQ1NzkzNzE1MSwic2VsZWN0aW9uU291cmNlIjoiWklQX0NPREVfQllfVVNFUiJ9LCJzaGlwcGluZ0FkZHJlc3MiOnsidGltZXN0YW1wIjoxNjg4NDU3OTM3MTUxLCJ0eXBlIjoicGFydGlhbC1sb2NhdGlvbiIsImdpZnRBZGRyZXNzIjpmYWxzZSwicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiZGVsaXZlcnlTdG9yZUxpc3QiOlt7Im5vZGVJZCI6IjMwODEiLCJ0eXBlIjoiREVMSVZFUlkiLCJ0aW1lc3RhbXAiOjE2ODg0NTc5MzcxNTAsInNlbGVjdGlvblR5cGUiOiJMU19TRUxFQ1RFRCIsInNlbGVjdGlvblNvdXJjZSI6IlpJUF9DT0RFX0JZX1VTRVIifV19LCJwb3N0YWxDb2RlIjp7InRpbWVzdGFtcCI6MTY4ODQ1NzkzNzE1MSwiYmFzZSI6Ijk1ODI5In0sInZhbGlkYXRlS2V5IjoicHJvZDp2Mjo3M2M2ZDE2ZS00M2FlLTQ5NzktYTcwNi0xODdkODMxYzc2ZjkifQ%3D%3D; locDataV3=eyJpc0RlZmF1bHRlZCI6dHJ1ZSwiaXNFeHBsaWNpdCI6ZmFsc2UsImludGVudCI6IlNISVBQSU5HIiwicGlja3VwIjpbeyJidUlkIjoiMCIsIm5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJub2RlVHlwZSI6IlNUT1JFIiwiYWRkcmVzcyI6eyJwb3N0YWxDb2RlIjoiOTU4MjkiLCJhZGRyZXNzTGluZTEiOiI4OTE1IEdlcmJlciBSb2FkIiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeSI6IlVTIiwicG9zdGFsQ29kZTkiOiI5NTgyOS0wMDAwIn0sImdlb1BvaW50Ijp7ImxhdGl0dWRlIjozOC40ODI2NzcsImxvbmdpdHVkZSI6LTEyMS4zNjkwMjZ9LCJpc0dsYXNzRW5hYmxlZCI6dHJ1ZSwic2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwidW5TY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJodWJOb2RlSWQiOiIzMDgxIiwic3RvcmVIcnMiOiIwNjowMC0yMzowMCIsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIlBJQ0tVUF9DVVJCU0lERSIsIlBJQ0tVUF9JTlNUT1JFIl19XSwic2hpcHBpbmdBZGRyZXNzIjp7ImxhdGl0dWRlIjozOC40NzQ2LCJsb25naXR1ZGUiOi0xMjEuMzQzOCwicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVU0EiLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJpbnRlbnQiOiJQSUNLVVAifSwiaW5zdG9yZSI6ZmFsc2UsImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJpc0V4cHJlc3NEZWxpdmVyeU9ubHkiOmZhbHNlLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl0sInNlbGVjdGlvblR5cGUiOiJMU19TRUxFQ1RFRCJ9LCJyZWZyZXNoQXQiOjE2ODg0NjM3Mjg0NzgsInZhbGlkYXRlS2V5IjoicHJvZDp2Mjo3M2M2ZDE2ZS00M2FlLTQ5NzktYTcwNi0xODdkODMxYzc2ZjkifQ%3D%3D; pxcts=769fb22a-1a49-11ee-997c-51754e494271; _px3=e68967e54ebdc749a5ad29bcd18dd3c29a0e55169291b24ebcdb0cafd6215055:H71XHBvLopgdYvEYdXzWbkNuYbl9tvtyyeSkrYnL+luJU5+EOtAD8cPq9e+iFajp1UMHNPowxxM72ZDIKqX+7g==:1000:q07VwB0YL0ZijQiMLal46sIFT5lB4TmQJeOJxdgD2i70gkaQV3/n13ZqZdRI72iIiqXKtiKZ4WhirzHDPUkhV0LnncJ851aRWkIv3CfOcWlsVgsIH1AWo+ZOYJ1jh833EnYGDie1WbJQbxY/4YlFZsd1/roajBbGnv2VdR+Y8sypUPrY5maZcBDWzNd3EYCktv5+6GxnIH1BTwIAtxz6jQ==; _pxde=d16fd4542c73f29e4d0661c4361c451b425535ff779b8f3262fa6798aa1053b3:eyJ0aW1lc3RhbXAiOjE2ODg0NjE1MzE0ODJ9; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1688461711577@firstcreate:1688459013106"; xpm=0%2B1688461711%2BZV4XF19kqR87hp6NvYWKOU~%2B0; xptwg=1597258474:47B56F8D4B4C00:B6681B:8CB5DEC:28EE715B:3BEECD6D:; xptwj=qq:5dda355e49c420d64789:LobhMy024l8LSKZNt0L1yyP68KXucXYVH+oWWbFRPI6vOM11FaLzhtvx+eBt37U/0dFYdPsuec1SHVxb8fJTXllhhhkdV0VKoBMqEP+Pv8mGMcVH2KFVNBgzDIDmLhadJRIua4o2yuB+GWScwIk0tzGnvS7wDy22fRf9t9x5uLkIwioiYjQ/dQM14xAX9Ky3D3Aww6sdQRYEKD3yI8qhwkoP; TS012768cf=0178545c905740629ed28a80fab754fe367e131769b7fd33e23003fc2899283abd354e0bb4a5b61c4bcc06ef344aa56709656c4798; TS01a90220=0178545c905740629ed28a80fab754fe367e131769b7fd33e23003fc2899283abd354e0bb4a5b61c4bcc06ef344aa56709656c4798; TS2a5e0c5c027=0881c5dd0aab20008aaedf6f2fea6ba07fd95bd6992d4b348732f303afcfcb2143cdbe6b4ec7dc3408f5fa8c75113000a8131510a3f211ee2dfa02a4c4dcd4d849a69ef8ed530de31f53b8db3968a022819610952f95220df21a8b7c7f69df20' \
  -H 'accept: application/json' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'device_profile_ref_id: iFp6Hi50uc-gNvplE2uA4NA0qnOlAN2G04Gj' \
  -H 'dnt: 1' \
  -H 'lists-device-type: desktop' \
  -H 'referer: https://www.walmart.com/lists/shared/WL/'${array[1]}'' \
  -H 'sec-ch-ua: "Chromium";v="106", "Microsoft Edge";v="106", "Not;A=Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'traceparent: 00-7397a0a5fef6de55685b3d3eca6a245a-ffc7eb1e30e2892c-00' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50' \
  -H 'wm_mp: true' \
  -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/'${array[1]}'' \
  -H 'wm_qos.correlation_id: aN3Kozf7JSv9SfIdoMq_jMSUZTmEjc-3K_wf' \
  -H 'x-apollo-operation-name: getListDetails' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-correlation-id: aN3Kozf7JSv9SfIdoMq_jMSUZTmEjc-3K_wf' \
  -H 'x-o-gql-query: query getListDetails' \
  -H 'x-o-mart: B2C' \
  -H 'x-o-platform: rweb' \
  -H 'x-o-platform-version: main-1.26.0-be17f7' \
  -H 'x-o-segment: oaoh' \
  --compressed`

    list2=`curl -s 'https://www.walmart.com/orchestra/home/graphql/getListDetails/4fb20c34987f00ecdbbf4f388b7ddc80a70519f2d9f87c615b59f71834124dcd?variables=%7B%22input%22%3A%7B%22id%22%3A%22'${array[1]}'%22%2C%22listType%22%3A%22WL%22%2C%22pagination%22%3A%7B%22page%22%3A2%2C%22pageSize%22%3A1%7D%2C%22sortOrder%22%3A%22DEFAULT%22%2C%22maxItems%22%3Atrue%2C%22skipGeneric%22%3Atrue%2C%22permission%22%3A%22VIEW%22%7D%7D' \
  -H 'authority: www.walmart.com' \
  -H 'cookie: vtc=ZV4XF19kqR87hp6NvYWKOU; _m=9; _pxvid=b53b4e32-559d-11ed-b409-654a64435159; dimensionData=945; g=1; _sp_id.ad94=7e93d7be-379a-4c09-b03d-8602e64d9df1.1672191400.2.1680338260.1672191401.c2cfe04a-7222-4c56-9d33-05312067970c; abqme=true; _pxhd=bf8d63c794f7086339958e68548ab23a092ec2021c963c5ecc12453ce2386607:b53b4e32-559d-11ed-b409-b1f43a4e2b7f; TBV=7; akehab=ipctrl; userAppVersion=main-1.82.1-68a152-0628T2056; sod=torbit1688246583; hasLocData=1; bstc=cumQWvRYwD--hBTHa-V-lU; mobileweb=0; xpth=x-o-mart%2BB2C~x-o-mverified%2Bfalse; _astc=c9d3cd08460bf6daf2d5b8b18a6d3aa9; hasACID=true; assortmentStoreId=3081; ACID=73c6d16e-43ae-4979-a706-187d831c76f9; xpa=0Iadf|0KA3-|0uTG6|2NYvd|3K-KJ|5M-UN|5e9Fg|8cYMq|8oGja|9-5I8|BukPC|CMCyD|DcdL-|FjLG1|GycPV|IRAHO|IhmrE|KvYZX|N0ixq|O4zXd|OFXXb|OpwGp|S7lM8|SoVwe|TWhvb|U3NAT|VDAFc|YnYws|ZgSVh|_NzN8|_uNDy|a_rrh|dayNl|gjQMr|jyp9o|kJc_t|pcXyb|qkVpx|u2iCd|vK1I8|wXvq0|xTsTj|zW-ys; exp-ck=0Iadf10uTG615M-UN18cYMq19-5I81BukPC1CMCyD1FjLG11GycPV1IRAHO1KvYZX1O4zXd1TWhvb1VDAFc1YnYws4ZgSVh1_NzN81_uNDy1a_rrh2kJc_t1pcXyb1qkVpx1u2iCd1vK1I81zW-ys1; xptc=assortmentStoreId%2B3081; adblocked=true; akavpau_p2=1688459616~id=d8f718f85e7f540107adfb221c0a999e; bm_mi=BA00D8D7185E1D608372396088052474~YAAQlAqrcUVQ1B+JAQAA/3wBIBSbmwssZDG+eB1QkONRkM7bqWXjYjySDpawxejeGpf5ygwLzpmk3Vy+HfjexzQgdBfL7zo4nHqWk3k4rFyfYCwzULd8X2wRR8vo9AEDQNBiqgzbci79lIGm4wBSm/NyUywl9fmoC7+rJcQiASWgvfYY9XyaOmXzFh1rlqGwhSUxTRWIwptUmbaoevmpHEEJ6H6sk6SBMQIltnV2WknArC8cQN/1g28Bw3nq9SlBC0m5OiCzdnIZ+uL94/jQLQYR369J/dvnLey0j6wBMODMBh1/GPBY70TMDRJD2fR33MUnHeGWYj12LmXa34LU84CJlaBIiLuq+uUZp0xGlsbkbu5bJ0ak7WpANdvxlfpXhnEk~1; bm_sv=B1DAFB01961E6B57DD4D4C642DF49638~YAAQlAqrcStR1B+JAQAAC7YBIBTD6SxeyPz9aU7ZdvyC5zrrfmgo1fSKSH3NfdJKys0W8R7AC4YxpgGL4Nm9qx0R+8NGICmRRNX+9yd76ELu6VEGrCtgGFuraAhkx6r5GT/0ZR6dDmtL8nvoe7EMg/N0T9wlwPoRXPz6ChvVOvB8u6KBUfPRQIOnuJAmPhuehD5UNuHQZvg3x/WGmumKjVXkoD1REXlMj2i071+8TZ5ycpsdi//xooagAyHSZAjsEBs=~1; ak_bmsc=4DE08386B098AB9379D9495D0F76A2E5~000000000000000000000000000000~YAAQlAqrcdRR1B+JAQAAbNUBIBSdpsYvAjmNKjXaQsVjZeZ3hFZsObeL/mDPXYBtzKe9qtrFw+wZiOzfz6DG/oBWE7j1u9R5gI9bD1Isj1AW1lR+FplAKCIaHyHz/BVfZZcI7dz10c77jeDynnaSZKvFUGY1sFE8iUGatEPSTJUVBccE+WzC8voNRl1q4IxA9jpJWOgtJFSU1qM5CykopL04Szt2wydaMT6GJN+uilX1h++/3D2rSmSAqd3J4sN9oxBHn74mk0/R0hpXDDLW60fHZggGxG/ZdH1a1qepAq0zfJSMq7mwmJ/70WLSVIgoTkvlMIaNDjaj0906LVLkVyx3Kv7QogoOi7L5TCD2vLppbnXTwJZDJZboqjv/aFw0n5w8hxRSHNdhPW/TAFl4oakRsenIpmgGxy1Ol9vN+eAvx/5aJHk3CizJxP65jtHab+rnq/LxUmmeONNH4hY0b/mLEk1Rb4pvWp8wg3NZFm0y8Yv10Q==; AID=wmlspartner%3D0%3Areflectorid%3D0000000000000000000000%3Alastupd%3D1688459160959; auth=MTAyOTYyMDE4YebgTKpaBg%2FgJjZIK0NdBvdFXCcZAVtcM5yo9sDpvUmEY899US54XB6i2U4l7qnb2VL8Xy9LG7L4PfYzfkI57hJB%2Foqseho%2FHvbBuUmIU5sDh%2BgnQfT0d0cKwwJEgo%2FM767wuZloTfhm7Wk2KcjygkeeSCv4Chv5IarMOQ7pqjet%2BhksjFayEeJNMdRyNi32zrG6L%2BCAjUVZ%2FI6DCxMke3INqYHNCsZv6jHGG7ixf2YUMk70P8glgOEpLOprhDfMDCcb9mgycy9jtT1uIyOBHRIVpi42a8UFdwgNpYUAMqtKnKJ%2FqcX5sRloGT7yl1Zkz5XDKOrD7WEGaEHgOibkLynqMcdy1TmLITt6%2FR0aRfBanSNb9HJRi1lS%2BTgQdPxAFJ1diLoi4%2BCIXCtR%2BXzQ8EjyrOXbKKhH072NS%2FW0j%2FU%3D; locGuestData=eyJpbnRlbnQiOiJTSElQUElORyIsImlzRXhwbGljaXQiOmZhbHNlLCJzdG9yZUludGVudCI6IlBJQ0tVUCIsIm1lcmdlRmxhZyI6ZmFsc2UsImlzRGVmYXVsdGVkIjp0cnVlLCJwaWNrdXAiOnsibm9kZUlkIjoiMzA4MSIsInRpbWVzdGFtcCI6MTY4ODQ1NzkzNzE1MSwic2VsZWN0aW9uU291cmNlIjoiWklQX0NPREVfQllfVVNFUiJ9LCJzaGlwcGluZ0FkZHJlc3MiOnsidGltZXN0YW1wIjoxNjg4NDU3OTM3MTUxLCJ0eXBlIjoicGFydGlhbC1sb2NhdGlvbiIsImdpZnRBZGRyZXNzIjpmYWxzZSwicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiZGVsaXZlcnlTdG9yZUxpc3QiOlt7Im5vZGVJZCI6IjMwODEiLCJ0eXBlIjoiREVMSVZFUlkiLCJ0aW1lc3RhbXAiOjE2ODg0NTc5MzcxNTAsInNlbGVjdGlvblR5cGUiOiJMU19TRUxFQ1RFRCIsInNlbGVjdGlvblNvdXJjZSI6IlpJUF9DT0RFX0JZX1VTRVIifV19LCJwb3N0YWxDb2RlIjp7InRpbWVzdGFtcCI6MTY4ODQ1NzkzNzE1MSwiYmFzZSI6Ijk1ODI5In0sInZhbGlkYXRlS2V5IjoicHJvZDp2Mjo3M2M2ZDE2ZS00M2FlLTQ5NzktYTcwNi0xODdkODMxYzc2ZjkifQ%3D%3D; locDataV3=eyJpc0RlZmF1bHRlZCI6dHJ1ZSwiaXNFeHBsaWNpdCI6ZmFsc2UsImludGVudCI6IlNISVBQSU5HIiwicGlja3VwIjpbeyJidUlkIjoiMCIsIm5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJub2RlVHlwZSI6IlNUT1JFIiwiYWRkcmVzcyI6eyJwb3N0YWxDb2RlIjoiOTU4MjkiLCJhZGRyZXNzTGluZTEiOiI4OTE1IEdlcmJlciBSb2FkIiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeSI6IlVTIiwicG9zdGFsQ29kZTkiOiI5NTgyOS0wMDAwIn0sImdlb1BvaW50Ijp7ImxhdGl0dWRlIjozOC40ODI2NzcsImxvbmdpdHVkZSI6LTEyMS4zNjkwMjZ9LCJpc0dsYXNzRW5hYmxlZCI6dHJ1ZSwic2NoZWR1bGVkRW5hYmxlZCI6dHJ1ZSwidW5TY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJodWJOb2RlSWQiOiIzMDgxIiwic3RvcmVIcnMiOiIwNjowMC0yMzowMCIsInN1cHBvcnRlZEFjY2Vzc1R5cGVzIjpbIlBJQ0tVUF9DVVJCU0lERSIsIlBJQ0tVUF9JTlNUT1JFIl19XSwic2hpcHBpbmdBZGRyZXNzIjp7ImxhdGl0dWRlIjozOC40NzQ2LCJsb25naXR1ZGUiOi0xMjEuMzQzOCwicG9zdGFsQ29kZSI6Ijk1ODI5IiwiY2l0eSI6IlNhY3JhbWVudG8iLCJzdGF0ZSI6IkNBIiwiY291bnRyeUNvZGUiOiJVU0EiLCJnaWZ0QWRkcmVzcyI6ZmFsc2V9LCJhc3NvcnRtZW50Ijp7Im5vZGVJZCI6IjMwODEiLCJkaXNwbGF5TmFtZSI6IlNhY3JhbWVudG8gU3VwZXJjZW50ZXIiLCJpbnRlbnQiOiJQSUNLVVAifSwiaW5zdG9yZSI6ZmFsc2UsImRlbGl2ZXJ5Ijp7ImJ1SWQiOiIwIiwibm9kZUlkIjoiMzA4MSIsImRpc3BsYXlOYW1lIjoiU2FjcmFtZW50byBTdXBlcmNlbnRlciIsIm5vZGVUeXBlIjoiU1RPUkUiLCJhZGRyZXNzIjp7InBvc3RhbENvZGUiOiI5NTgyOSIsImFkZHJlc3NMaW5lMSI6Ijg5MTUgR2VyYmVyIFJvYWQiLCJjaXR5IjoiU2FjcmFtZW50byIsInN0YXRlIjoiQ0EiLCJjb3VudHJ5IjoiVVMiLCJwb3N0YWxDb2RlOSI6Ijk1ODI5LTAwMDAifSwiZ2VvUG9pbnQiOnsibGF0aXR1ZGUiOjM4LjQ4MjY3NywibG9uZ2l0dWRlIjotMTIxLjM2OTAyNn0sImlzR2xhc3NFbmFibGVkIjp0cnVlLCJzY2hlZHVsZWRFbmFibGVkIjp0cnVlLCJ1blNjaGVkdWxlZEVuYWJsZWQiOnRydWUsImFjY2Vzc1BvaW50cyI6W3siYWNjZXNzVHlwZSI6IkRFTElWRVJZX0FERFJFU1MifV0sImh1Yk5vZGVJZCI6IjMwODEiLCJpc0V4cHJlc3NEZWxpdmVyeU9ubHkiOmZhbHNlLCJzdXBwb3J0ZWRBY2Nlc3NUeXBlcyI6WyJERUxJVkVSWV9BRERSRVNTIl0sInNlbGVjdGlvblR5cGUiOiJMU19TRUxFQ1RFRCJ9LCJyZWZyZXNoQXQiOjE2ODg0NjM3Mjg0NzgsInZhbGlkYXRlS2V5IjoicHJvZDp2Mjo3M2M2ZDE2ZS00M2FlLTQ5NzktYTcwNi0xODdkODMxYzc2ZjkifQ%3D%3D; pxcts=769fb22a-1a49-11ee-997c-51754e494271; _px3=e68967e54ebdc749a5ad29bcd18dd3c29a0e55169291b24ebcdb0cafd6215055:H71XHBvLopgdYvEYdXzWbkNuYbl9tvtyyeSkrYnL+luJU5+EOtAD8cPq9e+iFajp1UMHNPowxxM72ZDIKqX+7g==:1000:q07VwB0YL0ZijQiMLal46sIFT5lB4TmQJeOJxdgD2i70gkaQV3/n13ZqZdRI72iIiqXKtiKZ4WhirzHDPUkhV0LnncJ851aRWkIv3CfOcWlsVgsIH1AWo+ZOYJ1jh833EnYGDie1WbJQbxY/4YlFZsd1/roajBbGnv2VdR+Y8sypUPrY5maZcBDWzNd3EYCktv5+6GxnIH1BTwIAtxz6jQ==; _pxde=d16fd4542c73f29e4d0661c4361c451b425535ff779b8f3262fa6798aa1053b3:eyJ0aW1lc3RhbXAiOjE2ODg0NjE1MzE0ODJ9; com.wm.reflector="reflectorid:0000000000000000000000@lastupd:1688461711577@firstcreate:1688459013106"; xpm=0%2B1688461711%2BZV4XF19kqR87hp6NvYWKOU~%2B0; xptwg=1597258474:47B56F8D4B4C00:B6681B:8CB5DEC:28EE715B:3BEECD6D:; xptwj=qq:5dda355e49c420d64789:LobhMy024l8LSKZNt0L1yyP68KXucXYVH+oWWbFRPI6vOM11FaLzhtvx+eBt37U/0dFYdPsuec1SHVxb8fJTXllhhhkdV0VKoBMqEP+Pv8mGMcVH2KFVNBgzDIDmLhadJRIua4o2yuB+GWScwIk0tzGnvS7wDy22fRf9t9x5uLkIwioiYjQ/dQM14xAX9Ky3D3Aww6sdQRYEKD3yI8qhwkoP; TS012768cf=0178545c905740629ed28a80fab754fe367e131769b7fd33e23003fc2899283abd354e0bb4a5b61c4bcc06ef344aa56709656c4798; TS01a90220=0178545c905740629ed28a80fab754fe367e131769b7fd33e23003fc2899283abd354e0bb4a5b61c4bcc06ef344aa56709656c4798; TS2a5e0c5c027=0881c5dd0aab20008aaedf6f2fea6ba07fd95bd6992d4b348732f303afcfcb2143cdbe6b4ec7dc3408f5fa8c75113000a8131510a3f211ee2dfa02a4c4dcd4d849a69ef8ed530de31f53b8db3968a022819610952f95220df21a8b7c7f69df20' \
  -H 'accept: application/json' \
  -H 'accept-language: vi' \
  -H 'content-type: application/json' \
  -H 'device_profile_ref_id: iFp6Hi50uc-gNvplE2uA4NA0qnOlAN2G04Gj' \
  -H 'dnt: 1' \
  -H 'lists-device-type: desktop' \
  -H 'referer: https://www.walmart.com/lists/shared/WL/'${array[1]}'' \
  -H 'sec-ch-ua: "Chromium";v="106", "Microsoft Edge";v="106", "Not;A=Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'traceparent: 00-7397a0a5fef6de55685b3d3eca6a245a-ffc7eb1e30e2892c-00' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36 Edg/113.0.1774.50' \
  -H 'wm_mp: true' \
  -H 'wm_page_url: https://www.walmart.com/lists/shared/WL/'${array[1]}'' \
  -H 'wm_qos.correlation_id: aN3Kozf7JSv9SfIdoMq_jMSUZTmEjc-3K_wf' \
  -H 'x-apollo-operation-name: getListDetails' \
  -H 'x-enable-server-timing: 1' \
  -H 'x-latency-trace: 1' \
  -H 'x-o-bu: WALMART-US' \
  -H 'x-o-ccm: server' \
  -H 'x-o-correlation-id: aN3Kozf7JSv9SfIdoMq_jMSUZTmEjc-3K_wf' \
  -H 'x-o-gql-query: query getListDetails' \
  -H 'x-o-mart: B2C' \
  -H 'x-o-platform: rweb' \
  -H 'x-o-platform-version: main-1.26.0-be17f7' \
  -H 'x-o-segment: oaoh' \
  --compressed`

    if [[ $list =~ "blocked" ]]
      then
        link=`echo $list | jq '.redirectUrl' | sed 's/"//g'`
        `open -n -a /Applications/Microsoft\ Edge.app --args --profile-directory=Default https://walmart.com$link`
        read -n 1 -p "blocked"
        echo 'Thoát script'
        exit 1
      else
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> ebay-usItemId.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.usItemId' >> ebay-usItemId.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> ebay-currentPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.currentPrice.price' >> ebay-currentPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.priceInfo.wasPrice.price' | sed 's/null//g' >> ebay-wasPrice.txt
        echo $list | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> ebay-availabilityStatus.txt
        echo $list2 | jq '.data.shoppingListDetails.items.listItems[].product.availabilityStatus' >> ebay-availabilityStatus.txt
        echo ${array[0]}
        break
    fi
  done
done < 1-list.txt

git add -A .
git commit -m --allow-empty
git push
git push origin HEAD -f
gitCommit=`git rev-parse HEAD`
linkGit=`echo https://raw.githubusercontent.com/thaibinhdev/dev/`$gitCommit`echo /`
linkApi=`echo https://script.google.com/macros/s/AKfycbz8KpKxkoZYQieBmAgWkgSvFjRmaX6XrmgZobjeMMrjltO2xbLVYBCXrIs9CodSEskRkA/exec?`
linkPost=$linkApi`echo LinkID==IMPORTDATA\(\"`$linkGit`echo ebay-usItemId.txt\"\)\
\&GiaHienTai==IMPORTDATA\(\"`$linkGit`echo ebay-currentPrice.txt\"\)\
\&TrangThaiHang==IMPORTDATA\(\"`$linkGit`echo ebay-availabilityStatus.txt\"\)\
\&GiaGoc==IMPORTDATA\(\"`$linkGit`echo ebay-wasPrice.txt\"\)
`
echo '[InternetShortcut]\
URL='$linkPost > 1.url
open 1.url
