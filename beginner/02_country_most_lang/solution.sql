SELECT name
FROM countries c
JOIN (
    SELECT country_code as code, COUNT(language) as total_languages
    FROM country_languages
    GROUP BY code
) lang_count on c.code = lang_count.code
ORDER BY total_languages DESC
LIMIT 1
