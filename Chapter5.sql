SELECT *
from artist as art
inner join album as alb
on art.artist_id = alb.artist_id;

SELECT * 
from artist as art
inner join album as alb
using (artist_id);

SELECT 
	alb1.artist_id,
	alb1.title as alb1_title,
	alb2.title as alb2_title
from album as alb1
INNER join album as alb2
on art1.artist_id = art2.artist_id
where alb1.album_id <>alb2.album_id;

select *
from artist as art
left join album as alb
on art.artist_id = alb.artist_id;

SELECT * 
from artist as art
right join album as alb
on art.artist_id = alb.artist_id;

SELECT * 
from artist as art
full outer join album as alb
on art.artist_id = alb.artist_id;

SELECT name,title
from artist
CROSS join album;

select artist_id 
from artist
union 
select artist_id
from album;

select artist_id
from artist
union ALL
SELECT artist_id
from album;

select artist_id
from artist
INTERSECT
SELECT artist_id
from album;

select artist_id
from artist
EXCEPT
SELECT artist_id
from album;

select *
from album
where artist_id IN
(SELECT artist_id
 FROM artist);
 
 SELECT *
 from album
 where artist_id not in 
 (select artist_id
  from artist);
