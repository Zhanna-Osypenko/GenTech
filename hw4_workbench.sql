-- 1. Наполнить произвольными данными таблицы streams, reactions, donations

INSERT INTO donations (donation_id, created_at, amount, donator_id, stream_id)
VALUES
	 (1, CURRENT_TIMESTAMP, 5, 3, 50),
	 (2, CURRENT_TIMESTAMP, 24, 5, 15),
	 (3, CURRENT_TIMESTAMP, 7, 11, 3),
     (4, CURRENT_TIMESTAMP, 35, 1, 6),
     (5, CURRENT_TIMESTAMP, 10, 2, 34);

INSERT INTO reactions (reaction_id, created_at, author_id, stream_id, `value`)
VALUES
	 (1, CURRENT_TIMESTAMP, 5, 2, 3),
	 (2, CURRENT_TIMESTAMP, 7, 1, 5),
	 (3, CURRENT_TIMESTAMP, 1, 4, 5),
     (4, CURRENT_TIMESTAMP, 2, 3, 4),
     (5, CURRENT_TIMESTAMP, 4, 5, 3);

INSERT INTO streams (stream_id, created_at, author_id, title, is_completed)
VALUES
	 (1, CURRENT_TIMESTAMP, 1, "FrontChat", true),
	 (2, CURRENT_TIMESTAMP, 7, "CodeWave", true),
	 (3, CURRENT_TIMESTAMP, 6, "FrontFlix", false),
     (4, CURRENT_TIMESTAMP, 4, "DevEdge", true),
     (5, CURRENT_TIMESTAMP, 3, "HTMLive", false);

-- 2. Вывести информацию по стримам (проекция: имя_автора, название_стрима)

select users.username, streams.title
from streams
join users on streams.author_id = users.user_id


-- 3. Вывести список пожертвований в порядке убывания размера (проекция: размерпожертвования, имядонатара, название_стрима)

select donations.amount, donations.donator_id, streams.title
from donations
left join streams on donations.donator_id = streams.author_id


