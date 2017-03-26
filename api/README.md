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
Örnek json
```json
[
  {
    "_id": "58d57df4ff31fc97fbfe343e",
    "city_id": 1,
    "name": "Adana"
  },
  {
    "_id": "58d57df4ff31fc97fbfe343f",
    "city_id": 3,
    "name": "Afyonkarahisar"
  }
 ]
```
  2) Lokasyon 
Lokasyon için endpoint /place
İsme göre arama yapmak için /place?search=xxx
Lokasyon bazlı arama yapmak için /place?lat=xxx&lng=xxx
Tek çağırmak için /place/:id
Şehre göre arama yapmak için /place?sehir.isim=adana /* sehir.isim dememizin sebebi şehir bir array içindeki isim sekmesinden arama yapıyoruz
Liste örnek json
```json
[
  {
    "_id": "58d66376930c476cab7476df",
    "geo": [
      41.0783054,
      29.0221291
    ],
    "__v": 0,
    "city": {
      "_id": "58d57df4ff31fc97fbfe346e",
      "city_id": 34,
      "name": "İstanbul"
    },
    "name": "Getir Perakende Lojistik A.Ş.",
    "category": "yiyecek",
    "comments": [
      "58d6984dc55c4175edb189cd",
      "58d6984dc55c4175edb189ce",
      "58d6984dc55c4175edb189d0",
      "58d6984dc55c4175edb189d1",
      "58d6984dc55c4175edb189cf",
      "58d6984dc55c4175edb189ef",
      "58d6984dc55c4175edb189f0",
      "58d6984dc55c4175edb189f4",
      "58d6984dc55c4175edb189f5",
      "58d6984dc55c4175edb189f9",
      "58d6984dc55c4175edb189e9",
      "58d6984dc55c4175edb189fe",
      "58d6984dc55c4175edb18a02",
      "58d6984dc55c4175edb18a03",
      "58d6984dc55c4175edb18a01",
      "58d6984dc55c4175edb18a00",
      "58d6984dc55c4175edb18a05",
      "58d6984dc55c4175edb189ff",
      "58d6984dc55c4175edb18a04"
    ],
    "pictures": [
      "https://lh3.googleusercontent.com/-orPLtSf08zc/VrMz1nI8i1I/AAAAAAAAABU/qGOVteaCjiYUqGDZAGelevvgoTSjSzdFACJkC/s540-k-no/",
      "http://webrazzi.com/wp-content/uploads/2015/08/getir-algida-kampanya.png",
      "http://d16z9skh5534b4.cloudfront.net/wp-content/uploads/2015/07/214.jpg"
    ]
  }
 ]
```

  3) Kullanıcılar
Kullanıcılar için endpoint /user
!!! Dikkat db de 5000 kullanıcı var direk /user diye çağırmak hataya sebep olur. Bu yüzden limit koymayı unutmayın
Limit koymak için user?limit=5 şeklinde limit koyabilirsiniz
Random user seçmek için /user?rand&limit=10 !!dikkat rand ve limit şart !
Kullancıları etikete göre aramak /user?tag.isim=xxx&limit=xx !! dikkat limit şart !!
```json
[
{
    "_id": "58d5ac5fe14d854d1039767d",
    "nat": "TR",
    "cell": "(759)-744-4506",
    "phone": "(359)-515-2694",
    "registered": "2015-04-22 05:13:36",
    "dob": "1990-12-24 10:47:08",
    "email": "meral.poçan@example.com",
    "gender": "female",
    "__v": 0,
    "tag": [
      {
        "_id": "58d5cd64e25e5a5d1bf1f87f",
        "__v": 0,
        "name": "tur"
      }
    ],
    "picture": {
      "large": "https://randomuser.me/api/portraits/women/81.jpg",
      "medium": "https://randomuser.me/api/portraits/med/women/81.jpg",
      "thumbnail": "https://randomuser.me/api/portraits/thumb/women/81.jpg"
    },
    "location": {
      "street": "6724 atatürk sk",
      "city": "erzurum",
      "state": "erzurum",
      "postcode": 41935
    },
    "name": {
      "title": "ms",
      "first": "meral",
      "last": "poçan"
    }
  }
 ]
```

  4) Yorum yapma
!!! önemli 
Yorum yaparken 3 parametre post ediyoruz
```json
{
"comment":"deneme yorumu",
"user_id": "58d5abc671238c383cfaaf41",
"place_id" : "58d5853db5db95188542ced4"
}
```

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

