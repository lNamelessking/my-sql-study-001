SELECT id, nickname
FROM profile p
JOIN (
    SELECT 
        owner_id, 
        COUNT(*) as profile_posts_count
    FROM post
    GROUP BY owner_id
) post_count on p.id = post_count.owner_id
WHERE profile_posts_count > 10
