Q1. How many users do we have?

Ans: 130 users

    select count(distinct user_uuid)
    from DEV_DB.DBT_SVADLURI.STG_USERS

Q2. On average, how many orders do we receive per hour?

Ans: 7.68

    select (COUNT(order_uuid)/DATEDIFF(hour, MIN(order_created_at_utc), MAX(order_created_at_utc))) AS avg_orders_per_hr
    from DEV_DB.DBT_SVADLURI.STG_ORDERS



Q3. On average, how long does an order take from being placed to being delivered?

Ans: 93.4 hrs

    select AVG(DATEDIFF(minute, order_created_at_utc, delivered_at_utc))/60 AS avg_hrs_to_deliver
    from DEV_DB.DBT_SVADLURI.STG_ORDERS
    where delivered_at_utc is not null


Q4. How many users have only made one purchase? Two purchases? Three+ purchases?

Note: you should consider a purchase to be a single order. In other words, if a user places one order for 3 products, they are considered to have made 1 purchase.

Ans: 25, 28 and 71

    With user_purchases as (select user_uuid,count(order_uuid) as num_purchases
    from DEV_DB.DBT_SVADLURI.STG_ORDERS
    group by user_uuid
                            )
    select (case when num_purchases = 1 then '1 purchase'
                when num_purchases = 2 then '2 purchases'
                else '3+ purchases'
                end) as no_of_purchases,
                count(user_uuid) AS num_users
    from user_purchases
    group by no_of_purchases



Q4. On average, how many unique sessions do we have per hour?

Ans: 10.14

    select (COUNT(distinct session_uuid)/DATEDIFF(hour, MIN(event_created_at_utc), MAX(event_created_at_utc))) AS avg_sessions_per_hr
    from DEV_DB.DBT_SVADLURI.STG_EVENTS