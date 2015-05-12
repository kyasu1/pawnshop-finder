module.exports =

  init: ->
    localStorage.clear()
    localStorage.setItem 'shops', JSON.stringify([
      {"id":1,"lat":35.887973,"lng":139.789377,"title":"エガワ質店","company":"（有）エガワ質店","zip":3430813,"prefecture":"埼玉県","city":"越谷市","street":"越ヶ谷1-10-14","tel":"048-962-7452","email":"egawa78@watch.ocn.ne.jp","offdays":"毎月2・7・12・17・22・27日"},
      {"id":3,"lat":35.868779,"lng":139.799099,"title":"まるや","company":"（有）FES丸屋質店","zip":3430842,"prefecture":"埼玉県","city":"越谷市","street":"蒲生旭町2-16","tel":"048-986-4429","email":"info@fes7.co.jp","offdays":"毎週木曜日"},
      {"id":5,"lat":35.87087,"lng":139.800929,"title":"ハラダ蒲生店","company":"（株）ハラダ","zip":3430841,"prefecture":"埼玉県","city":"越谷市","street":"蒲生東町16-29","tel":"048-985-0071","email":"ds-7harada@ac.auone-net.jp","offdays":"毎週月曜日・第1火曜日"},
      {"id":6,"lat":35.921779,"lng":139.778843,"title":"オガワ","company":"（有）小川商会","zip":3430032,"prefecture":"埼玉県","city":"越谷市","street":"袋山2018-11","tel":"048-976-9640","email":"ogawa783@nifty.com","offdays":"毎月2・7・12・17・22・27日"},
      {"id":7,"lat":35.866568,"lng":139.79506,"title":"池田屋","company":"（株）池田屋質店","zip":3430836,"prefecture":"埼玉県","city":"越谷市","street":"蒲生寿町13-45","tel":"048-987-0078","email":"m-ikeda7@mvb.biglobe.ne.jp","offdays":"毎週日曜日"},
      {"id":8,"lat":35.890967,"lng":139.785469,"title":"ハラダ越谷店","company":"（有）ファンドハウスハラダ","zip":3430816,"prefecture":"埼玉県","city":"越谷市","street":"弥生町6-7","tel":"048-966-1122","email":"p.h.harada@nifty.com","offdays":"毎週日曜日"},
      {"id":9,"lat":35.93754,"lng":139.775384,"title":"タケヤ質店","company":"（有）タケヤ","zip":3430042,"prefecture":"埼玉県","city":"越谷市","street":"千間台東1-4-10","tel":"048-979-1678","email":"yuji-ooi@tcat.ne.jp","offdays":"毎月7・8・17・23･27日"},
      {"id":10,"lat":35.866426,"lng":139.779734,"title":"質イコー","company":"（株）オフィスイコー","zip":3430851,"prefecture":"埼玉県","city":"越谷市","street":"七左町1-299-1","tel":"048-978-1020","email":"pawnshopiko@gmail.com","offdays":"毎週水曜日・第1/3火曜日"},
      {"id":11,"lat":35.903782,"lng":139.779877,"title":"アデ川","company":"（有）質SHOPアデ川","zip":3430025,"prefecture":"埼玉県","city":"越谷市","street":"大沢3-9-10","tel":"048-978-2278","email":"ade.kitakoshi78@cotton.ocn.ne.jp","offdays":"毎月6・7・16・17・26・27日"}
      {"id":12,"lat":34.710942,"lng":135.511925,"title":"丸万質舗","company":"（株）丸万質舗","zip":5310064,"prefecture":"大阪府","city":"大阪市","street":"北区国分寺2-1-16","tel":"06-6351-0078","email":"info@maruman7.co.jp","offdays":"日曜日・祝日"},
      {"id":13,"lat":35.735128,"lng":139.726204,"title":"さのや","company":"（株）山貴佐野屋","zip":1700004,"prefecture":"東京都","city":"豊島区","street":"北大塚3-33-9","tel":"03-3949-8111","email":"","offdays":""}
    ])