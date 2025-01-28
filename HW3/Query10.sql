-- ----------------------------------------------
--  Query 10: 
--  For each company find out which customers have spent the most and the least amounts.
-- ----------------------------------------------

-- Highest Spending Customers
select m.name as Company_Name, Highest_Spender.customer_name as Spender_Name, Highest_Spender.highest_spending as Spending_Amount
from merchants m
join (
    select mid, c.fullname as Customer_Name, sum(price) as Highest_Spending
    from merchants m
    join sell using (mid)
    join contain using (pid)
    join place using (oid)
    join orders using (oid)
    join customers c using (cid)
    group by mid, c.fullname
    having sum(price) = (
        select max(Total_Spending)
        from (
            select mid, c.fullname as Customer_Name, sum(price) as Total_Spending
            from merchants m
            join sell using (mid)
            join contain using (pid)
            join place using (oid)
            join orders using (oid)
            join customers c using (cid)
            group by mid, c.fullname
        ) as Max_Spenders
        where Max_Spenders.mid = m.mid
    )
) as Highest_Spender using (mid)

union

-- Lowest Spending Customers
select m.name as Company_Name, Lowest_Spender.customer_name as Spender_Name, Lowest_Spender.lowest_spending as Spending_Amount
from merchants m
join (
    select mid, c.fullname as Customer_Name, sum(price) as Lowest_Spending
    from merchants m
    join sell using (mid)
    join contain using (pid)
    join place using (oid)
    join orders using (oid)
    join customers c using (cid)
    GROUP BY mid, c.fullname
    having sum(price) = (
        select min(Total_Spending)
        from (
            select m.mid, c.fullname as Customer_Name, sum(price) as Total_Spending
            from merchants m
            join sell using (mid)
            join contain using (pid)
            join place using (oid)
            join orders using (oid)
            join customers c using (cid)
            group by mid, c.fullname
        ) as Min_Spenders
        where Min_Spenders.mid = m.mid
    )
) as Lowest_Spender using (mid)
order by company_name;