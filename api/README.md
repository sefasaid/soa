# SOA Api

[![N|Solid](http://i.hizliresim.com/W00rVq.png)]()

Bu api getir & bitaksi hackatonu için yazıldı

# Api Özellikleri

  - MongoDb bağlantısı
  - Tamamen restful
  - Dilediğin gibi kullanım imkanı (yaşasın opensource!)

Api test URL http://159.203.131.130:1453/

Genel bilgiler

Bütün endpointler

GET /endpoint

GET /endpoint/:id

POST /endpoint

PUT /endpoint/:id

DELETE /endpoint/:id
 
 şeklinde restfull şeklinde çalışıyor

Bütün apilerde limit,sort,skip var 

Bütün apilerde aşağıda gösterilen tabloda var olan methodların hepsi var 

[![N|Solid](http://i.hizliresim.com/j88Y4G.png)](http://i.hizliresim.com/j88Y4G.png)

  1)Şehir api
  
Şehirler için endpoint /city şeklinde

Tek şehri çağırmak için /city/:id şeklinde çağırabilir.


 2) Lokasyon 
  
Lokasyon için endpoint /place

İsme göre arama yapmak için /place?search=xxx

Lokasyon bazlı arama yapmak için /place?lat=xxx&lng=xxx

Tek çağırmak için /place/:id?populate=yorumlar -> !! dikkat populate mutlaka olmalı çünkü yorumlarla beraber 
alınabilmesi için

Şehre göre arama yapmak için /place?sehir.isim=adana /* sehir.isim dememizin sebebi şehir bir array içindeki isim sekmesinden arama yapıyoruz

  3) Kullanıcılar
  
Kullanıcılar için endpoint /user

!!! Dikkat db de 5000 kullanıcı var direk /user diye çağırmak hataya sebep olur. Bu yüzden limit koymayı unutmayın

Limit koymak için user?limit=5 şeklinde limit koyabilirsiniz

Random user seçmek için /user?rand&limit=10 !!dikkat rand ve limit şart !

Kullancıları etikete göre aramak /user?tag.isim=xxx&limit=xx !! dikkat limit şart !!


  4) Yorum yapma
  
!!! önemli 

Yorum yaparken 3 parametre post ediyoruz

{
"yorum":"deneme yorumu",
"user_id": "58d5abc671238c383cfaaf41",
"place_id" : "58d5853db5db95188542ced4"
}


yorum zaten belli user_id kullanıcı id place_id de yerin id si

endpoint olarak /comment kullanıyoruz

Comment tek başına kullanılmayacak çünkü konumları çekerken içinde hazır olarak geliyor. Bu yüzden tek başına kullanılması gereksiz

# Kullanılan paketler
- [node-restful](https://github.com/baugarten/node-restful)(zaten çoğu işi yapan paket :) )
- [mongoose](https://github.com/Automattic/mongoose) 
- [express](https://github.com/expressjs/express)
- [body-parser](https://github.com/expressjs/body-parser)

# Dumy data alınan yer
- user için [randomuser.me](https://randomuser.me)
- lokasyon için 

# Teşekkürler
[getir](https://getir.com/) & [bitaksi](http://www.bitaksi.com/)

