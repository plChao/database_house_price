## 介紹怎麼用
我每完成一個功能或事件就會創一個資料夾放，
所以資料夾標號最大者就是最新完成的。

使用方法是把資料夾裡的graph資料夾整個丟到 /var/www/html 中，
也就是會變成 /var/www/html/graph


## 紀錄一下各個資料夾做了甚麼事

### 0--add bargraph
就是先完成一個長條圖。
資料來源是先隨便模擬一個table命名score，並丟入數比資料，每個資料包含playerid和score

### 1--district queue + bargraph
把a_var_land_a.csv load進database，然後找出各個區的交易比數 並化成長條圖
結果可見result.png

### 2--add linegraph
找出每個區的平均單位交易房價，並化成折線圖
問題:我把長條圖和折線圖併在一起畫的時候，折線圖會在滑鼠移到圖上的時候消失
##### 折線圖結果可見result.png