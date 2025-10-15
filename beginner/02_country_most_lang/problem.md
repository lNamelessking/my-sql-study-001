# Задача: Страна с наибольшим количеством языков
## Условие задачи
Найдите страну, в которой используется наибольшее количество различных языков, и выведите её название.

**Поля в результирующей таблице:**
- `name`

<img width="1075" height="457" alt="image" src="https://github.com/user-attachments/assets/3c1a1e0c-4e0f-43d5-b34a-933952d01478" />


## Решение
<details> 
<summary>Открыть</summary>

#### Код

```sql
SELECT name
FROM countries c
JOIN (
    SELECT country_code as code, COUNT(language) as total_languages
    FROM country_languages
    GROUP BY code
) lang_count on c.code = lang_count.code
ORDER BY total_languages DESC
LIMIT 1
```

#### Алгоритм работы:

Сначала подсчитываем количество языков для каждой страны в подзапросе

Затем соединяем результат с таблицей стран по коду страны

Сортируем страны по убыванию количества языков

Берем первую страну из отсортированного списка

#### Ключевые особенности:

Использует JOIN с агрегирующим подзапросом

GROUP BY для подсчета языков по странам

ORDER BY + LIMIT 1 для нахождения максимального значения

Возвращает только название страны

</details>
