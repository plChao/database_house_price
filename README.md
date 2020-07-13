# database_house_price
## execute
1. put the data from [房價實價登陸](https://plvr.land.moi.gov.tw/DownloadOpenData?fbclid=IwAR2_FNpFB4Yxm0_6x9T7aX_0x-LSyLFdnOCcolJHDuMpe_EHuzqPe7jIyeA) to /data/original
2. run command
``` shell
python3 ./data/merge/data_merge.py
mysql -u root -p
> source ./script/method1_init.sql;
> exit
```
3. modify ./html/config.php with your mysql password
