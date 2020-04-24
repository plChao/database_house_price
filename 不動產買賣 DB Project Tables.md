# 不動產買賣 DB Project Tables

## name_translate
| 欄位中文                 | 欄位英文      |
|:------------------------ |:------------- |
| 鄉鎮市區                 | district      |
| 交易標的                 | trade_target  |
| 土地區段位置建物區段門牌 | address       |
| 土地移轉總面積平方公尺   | land_area     |
| 都市土地使用分區         | area_use      |
| 非都市土地使用分區         | nonmetro_d      |
| 非都市土地使用編定         | nonmetro_u      |
| 交易年月日               | trade_date    |
| 交易筆棟數               | target_detail |
| 移轉層次                 | trade_floor   |
| 總樓層數                 | total_floor   |
| 建物型態                 | state         |
| 主要用途                 | purpose       |
| 主要建材                 | materials     |
| 建築完成年月             | building_date |
| 建物移轉總面積平方公尺   | building_area |
| 建物現況格局-房          | room          |
| 建物現況格局-廳          | hall          |
| 建物現況格局-衛          | health        |
| 建物現況格局-隔間        | compartmented |
| 有無管理組織             | manage        |
| 總價元                   | price         |
| 單價元平方公尺           | unit_price    |
| 車位類別                 | berth_type    |
| 車位移轉總面積平方公尺   | berth_area    |
| 車位總價元               | berth_price   |
| 備註                     | note      |
| 編號                     | trade_id      |


---

## main_table

|Attribute Name| Description | Example |
| -------- | -------- | -------- |
|district | The villages and towns urban district     | 文山區 |
|trade_target| transaction sign     | 房地(土地+建物)+車位 |
|address| land sector position building sector house number plate     | 臺北市萬華區康定路1~30號 |
|land_area| land shifting total area square meter     |34.05 |
|area_use| the use zoning or compiles and checks     | 商 |
|nonmetro_d| the non-metropolis land use district     | 山坡地保育區 |
|nonmetro_u| non-metropolis land use     | 丙種建築用地 |
|trade_date| transaction year month and day     |1081220 |
|target_detail| transaction pen number (the details of "trade_target")    | 土地3建物1車位0 |
|trade_floor| shifting level     | 三層 |
|total_floor| total floor number     | 十五層 |
|state| building state     | 套房(1房1廳1衛) |
|purpose| main use      | 住家用 |
|materials| main building materials     | 鋼筋混凝土造 |
|building_date| year month and day of construction to complete     | 701209 |
|building_area| building shifting total area     | 23.04 |
|room| Building present situation pattern - room     | 4 |
|hall| building present situation pattern - hall     | 2 |
|health| building present situation pattern - health     | 3 |
|compartment| building present situation pattern - compartmented     | 有 |
|manage| Whether there is manages the organization or not    | 無 |
|price| total price NTD     | 6547000 |
|unit_price| the unit price (NTD / square meter)     | 243500 |
|berth_type| the berth category     | 坡道機械 |
|berth_area| berth shifting total area square meter     | 40.27 |
|berth_price| the berth total price NTD     | 1200000 |
|note | the note of extra describing | 含增建或未登記建物。; |
|trade_id | number of this transaction     | RPXNMLOLKHPFFBA38CA |
