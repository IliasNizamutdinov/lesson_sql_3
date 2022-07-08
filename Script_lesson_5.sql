select g."name", count(gos.singer_id)  from genres_of_singers gos
join genres g on gos.genre_id = g.id 
group by g."name";


select r."name", count(t.id)  from records r
join tracks t ON r.id = t.record_id 
where r.record_year  between 2018 and 2020
group by r."name";

select r."name", round(avg(t.long),1)  from records r
join tracks t ON r.id = t.record_id 
group by r."name";


select s1."name"  from singers s1
left join (select s.id as id  from singers s 
left join records_of_singers ros on s.id = ros.singer_id 
left join records r on ros.record_id = r.id 
where r.record_year = 2020
group by s.id) as s2  on s1.id = s2.id
where s2.id is null;

select c."name"  from singers s 
join records_of_singers ros on s.id = ros.singer_id 
join records r on ros.record_id  = r.id 
join tracks t on ros.record_id = t.record_id 
join tracks_of_collections toc on toc.id_track = t.id 
join collections c on c.id = toc.id_collection 
where s."name" = 'Леонтьев'
group by c."name"; 

select r."name" from records r 
join records_of_singers ros on r.id = ros.record_id 
join genres_of_singers gos on ros.singer_id = gos.singer_id
group by r."name", ros.singer_id
having count(gos.genre_id) > 1;

select t."name"  from tracks t 
left join tracks_of_collections toc ON t.id = toc.id_track 
where toc.id is null;

select t2."name" as track, r."name" as record, s."name" as singer  from tracks t2
join records r on t2.record_id = r.id
join records_of_singers ros on r.id = ros.record_id 
join singers s on ros.singer_id = s.id 
where (t2.long  = (select min(t.long) from tracks t));

select r."name"  from tracks t
join records r on t.record_id = r.id
group by r.id
having (count(t.id) = (select min(cr.count_track) from 
(select count(t.id) as count_track, r.id  from tracks t
join records r on t.record_id = r.id 
group by r.id) as cr )); 


 




