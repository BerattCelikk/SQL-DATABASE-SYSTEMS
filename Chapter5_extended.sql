/*
CREATE TABLE Artist (
    artist_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Album (
    album_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);


INSERT INTO Artist (artist_id, name) VALUES
(1, 'AC/DC'),
(2, 'Aerosmith'),
(3, 'Alanis Morissette');

INSERT INTO Album (album_id, title, artist_id) VALUES
(1, 'For those who rock', 1),
(2, 'Dream on', 2),
(3, 'Restless and wild', 2),
(4, 'Let there be rock', 1),
(5, 'Rumours', 6);
*/
--SELECT * from Artist,Album;

--INNER JOİN : İki tablo arasındaki bir iç birleştirme, yalnızca bir anahtar 
--gibi bir birleştirme alanının her iki tabloda da eşleşme bulduğu kayıtları döndürür.

/*
SELECT * 
from Artist as art
inner join album as alb 
on art.artist_id = alb.artist_id;

SELECT * 
from artist as art
inner join album as alb
using(artist_id) --kısaltması  => on art.artist_id = alb.artist_id;
*/
--SELF JOIN :bir tablodaki değerleri, aynı tablonun farklı bölümlerini birleştirerek
--tablodaki diğer değerlerle karşılaştırmak için kullanılır

/*
select 
	alb1.artist_id,
    alb1.title as alb1_title,
    alb2.title as alb2_title
from album as alb1
inner join album as alb2
on alb1.artist_id = alb2.artist_id
where alb1.album_id <> alb2.album_id;
*/
--LEFT JOIN : Sol birleştirme, sol tablodaki tüm orijinal kayıtları tutar ve birleştirme
--alanının eşleşme bulamadığı sağ tablodaki tüm sütunlar için eksik değerleri döndürür.

SELECT *
from artist as art
left join album as alb
on art.artist_id = alb.artist_id;

--RIGHT JOIN : Sağ birleştirme, tüm orijinal kayıtları sağ tabloda tutar ve birleştirme
--alanının eşleşme bulamadığı sol tablodaki tüm sütunlar için eksik değerleri döndürür.
--Sağ birleştirmeler sol birleştirmelerden çok daha az yaygındır, çünkü sağ birleştirmeler
--her zaman sol birleştirmeler olarak yeniden yazılabilir.

select *
from artist as art
right join album as alb
on art.artist_id = alb.artist_id;

--FULL JOIN : Tam birleşim, sol birleşim ve sağ birleşimleri birleştirir.Tam birleşim,
--diğer tabloda birleşme alanında bir  eşleşme olup olmadığına bakılmaksızın, bir
--tablodaki tüm kayıtları döndürür ve buna göre boş değerler döndürür.

SELECT *
from artist as art
full outer JOIN album as alb
on art.artist_id = alb.artist_id;

-- CROSS JOIN : iki olası kombinasyonun tümünü oluşturur
SELECT name,title
from artist
cross join album;

--UNION : iki ifadenin sonuçlarını dikey olarak birleştirmek için kullanılır. 
--Hata olmadan çalışmak için, tüm ifadelerin aynı sayıda
--sütun ve karşılık gelen sütunların aynı veri türüne sahip olması gerekir. 
--yinelenenleri döndürmez.

SELECT artist_id
from artist
UNION
SELECT artist_id
from album;

--UNION ALL :Operatör tıpkı gibi çalışır, ancak yinelenen değerleri döndürür. 
--Aynı kısıtlamalar için de geçerlidir

SELECT artist_id
from artist
UNION ALL
SELECT artist_id
from album;

-- INTERSECT : Operatör iki tablodan yalnızca aynı satırları döndürür.
SELECT artist_id
from artist
INTERSECT
SELECT artist_id
FROM album;

--EXCEPT : Operatör yalnızca sol tabloda olup sağ tabloda bulunmayan satırları döndürür.
SELECT artist_id
from artist
EXCEPT 
SELECT artist_id
from album;

--SEMI JOIN  : ikinci tabloda bir koşulun karşılandığı ilk tablodaki kayıtları seçer.
--Yarı birleştirme, ikinci tabloyu birinci tablo için filtre olarak kullanmak için bir
--madde kullanır. 

SELECT *
from album
where artist_id IN
(SELECT artist_id from artist);

--ANTI JOIN : Anti join, ikinci tabloda bir
--koşulun karşılandığı ilk tablodaki kayıtları seçer.
--İkinci tablodan değerleri hariç tutmak için bir
--ifade kullanır.

SELECT * 
from album
where artist_id not in 
(SELECT artist_id 
 from artist);

