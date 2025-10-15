# Задача: Поиск активных пользователей
## Условие задачи
Необходимо написать SQL-запрос, который возвращает всех пользователей, опубликовавших более 10 постов.
**Поля в результирующей таблице:**
- `id`
- `nickname`

  
<img width="924" height="420" alt="image" src="https://github.com/user-attachments/assets/35ad139c-c37c-4246-a9bc-1b03ac577a50" />


## Решение
<details> 
<summary>Открыть</summary>

#### Код

```sql
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
```

#### Алгоритм работы:

Сначала подсчитываем количество постов для каждого пользователя в подзапросе

Затем соединяем результат с таблицей профилей по ID владельца

Фильтруем пользователей, оставляя только тех, у кого больше 10 постов

#### Ключевые особенности:

Использует JOIN с агрегирующим подзапросом

GROUP BY для подсчета постов по пользователям

WHERE для фильтрации по количеству постов

Возвращает только требуемые поля: id и nickname

</details>

