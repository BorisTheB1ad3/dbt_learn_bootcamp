SELECT *
FROM {{ ref('fact_reviews') }} as f
INNER JOIN {{ ref('dim_listings_cleansed') }} as cl
    ON cl.listing_id = f.listing_id
    AND f.review_date <= cl.created_at