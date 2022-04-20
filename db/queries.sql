select *  from Orders
join Cake C on Orders.cakeid = C.cakeid
where custid = 1
order by ordertime desc;

select I.ingredid as ingredid, iname, qty from Contain join Cake C on Contain.cakeid = C.cakeid join Ingredient I on I.ingredid = Contain.ingredid where C.cakeid = 1;