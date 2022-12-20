{{
    config(
        materialized = 'view'
    )
}}
WITH src_listings AS (
    SELECT * FROM {{ ref('src_listings') }}
)
SELECT 
    listing_id,
    listing_name,
    room_type,
    CASE
        WHEN minimum_nights = 0 THEN 1
        ELSE minimum_nights
    END AS minimum_nights,
    REPLACE(price_str, '$')::NUMBER(10, 2) AS price,
    host_id,
    created_at,
    updated_at
FROM
    src_listings