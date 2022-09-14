-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 06 2021 г., 13:16
-- Версия сервера: 10.4.18-MariaDB
-- Версия PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `posts`
--

-- --------------------------------------------------------

--
-- Структура таблицы `author`
--

CREATE TABLE `author` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` char(200) NOT NULL,
  `cover` char(200) NOT NULL,
  `content` text NOT NULL,
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `author`
--

INSERT INTO `author` (`id`, `name`, `cover`, `content`, `cat_id`, `cat_name`) VALUES
(1, 'Макс Корж', 'img/author/authorMaxKorzh.jpg', '<p>Макс Корж — музыкант, певец, рэпер, мастер бешеных концертов и просто парень по соседству. За несколько лет он прошел путь от песен под гитару на флэтах до стадионов, но и сейчас его легко можно встретить на улицах Минска, пролетающего мимо вас на скейтборде.</p>', 3, 'Хип-Хоп'),
(2, 'Элджей', 'img/author/authorAllJ.jpg', '<p>Элджей - рэп проект Алексея Узенюка. Алексей родился в Новосибирске, музыкой увлекался с детства. За время своей музыкальной карьеры  успел выпустить 5 альбомов: \"Пушка\", \"Библиотека\", \"Бошки дымятся\", \"Катакомбы\", \"SayonaraBoy\".</p>', 3, 'Хип-Хоп'),
(3, 'L’One', 'img/author/authorLOne.png', '<p>Автор главного танцевального хита 2013 года «Все танцуют локтями», Леван Горозия, он же L’One, родился в октябре 1985 года в Красноярске. Вскоре переехал с родителями в Якутск, который и стал для него родным городом. Грузин по национальности, он быстро стал заметной фигурой в Якутске – играл в баскетбол, в КВН, был даже ведущим провинциального турнира по КВНу.</p>', 3, 'Хип-Хоп'),
(4, '25/17', 'img/author/25-17.jpg', '<p>25/17 - музыкальный проект родом из Омска, находящийся на стыке жанров альтернативного хип-хопа и рок-музыки. В составе Андрей \"Бледный\" и Антон \"Ант\". Ранее название: \"Иезекииль 25:17\". Это библейские строки, цитируемые героем Сэмюэла Джексона в фильме \"Криминальное Чтиво\": \"И совершу над ними великое мщение наказаниями яростными; и узнают, что Я Господь, когда совершу над ними Мое мщение\".</p>', 3, 'Хип-Хоп'),
(5, 'Skrillex', 'img/author/Skrillex.jpg', '<p>Со́нни Джон Мур, более известный по сценическому псевдониму Скри́ллекс — американский музыкант, продюсер, диджей, а также фронтмен рок-группы From First to Last. Принимал участие в записи альбома Korn The Path of Totality.</p>', 1, 'Электроника, Дабстеп');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` char(200) NOT NULL,
  `cover` char(200) NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `cover`, `content`) VALUES
(1, 'Электроника', 'img/techno.jpg', '<p>Первая статья.</p>'),
(2, 'Метал', 'img/metal.jpg', '<p>Вот и вторая статья</p>'),
(3, 'Хип-хоп', 'img/rap.jpg', '<p>Хип-хоп-музыка (англ. Hip hop music), также известная как рэп-музыка — музыкальный жанр популярной музыки, развитый в США афроамериканцами и латиноамериканцами, живущими в бедных районах Бронкса в Нью-Йорке в 1970-х годах. Хип-хоп-музыка состоит из стилизованной ритмичной музыки, которая обычно сопровождается рэпом, ритмичной и рифмованной речью, которую произносят нараспев.</p>'),
(4, 'Фолк', 'img/folk.jpg', '<p>Да, это четвертая статья.</p>'),
(5, 'Нео-классика', 'img/neoclassic.jpg', '<p>Первая статья.</p>'),
(6, 'Поп-музыка', 'img/pop.jpg', '<p>Вот и вторая статья</p>'),
(7, 'Джаз', 'img/jazz.jpg', '<p>Третья статья.</p>'),
(8, 'Кантри', 'img/country.jpg', '<p>Да, это четвертая статья.</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `music`
--

CREATE TABLE `music` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` char(200) NOT NULL,
  `file_url` char(200) NOT NULL,
  `content` text NOT NULL,
  `cat_id` int(10) UNSIGNED NOT NULL,
  `cat_name` text NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `author_name` text NOT NULL,
  `cover` varchar(200) NOT NULL,
  `album` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `music`
--

INSERT INTO `music` (`id`, `title`, `file_url`, `content`, `cat_id`, `cat_name`, `author_id`, `author_name`, `cover`, `album`) VALUES
(1, 'Макс Корж - Малый повзрослел', 'music/MaxKorzh/MalPovzroslel.mp3', '<p>Трек с четвёртого студийного альбома Макса Коржа, выпущенного 25 ноября 2016 года на лейбле «Respect Production».<br> В феврале 2017 года был выпущен клип на трек.<br></p>', 3, 'Хип-хоп', 1, 'Макс Корж', 'img/music/mal_povzroslel.jpg', 'Малый Повзрослел Ч.1'),
(2, 'Макс Корж - Малиновый закат', 'music/MaxKorzh/MalinZakat.mp3', '<p>Пластинка «Малый повзрослел. Ч. 2» стала одной из тех работ музыканта,<br> к прослушиванию которой время от времени возвращаются все его поклонники,<br> а композиция «Малиновый закат» – одним из лучших треков альбома.</p>', 3, 'Хип-хоп', 1, 'Макс Корж', 'img/music/mal_povzroslel_2.jpg', 'Малый Повзрослел Ч.2'),
(3, 'Макс Корж - Жить в кайф', 'music/MaxKorzh/ZhitVKaif.mp3', '<p>Трек с пластинки «Жить в кайф», презентованой 2 ноября 2013 года Максом на Минск-Арене.<br> Впервые в музыкальной истории Белоруссии белорусский артист собрал самую крупную площадку страны,<br> вмещающую в себя 13 тысяч человек.</p>', 3, 'Хип-хоп', 1, 'Макс Корж', 'img/music/ZhitVKaif.jpg', 'Жить в Кайф'),
(4, 'Макс Корж - Мотылёк', 'music/MaxKorzh/Motilek.mp3', '<p>Трек с пластинки «Жить в кайф», презентованой 2 ноября 2013 года Максом на Минск-Арене.<br> Впервые в музыкальной истории Белоруссии белорусский артист собрал самую крупную площадку страны,<br> вмещающую в себя 13 тысяч человек.</p>', 3, 'Хип-хоп', 1, 'Макс Корж', 'img/music/ZhitVKaif.jpg', 'Жить в Кайф'),
(5, 'Макс Корж - Шантаж', 'music/MaxKorzh/Shantazh.mp3', '<p>Ярким примером такого трека можно назвать «Шантаж», вышедший летом 2019 года.<br> Историю создания песни «Шантаж», а также интересные факты, текст и содержание композиции читайте на нашей странице.</p>', 3, 'Хип-хоп', 1, 'Макс Корж', 'img/music/Shantazh.png', 'Сингл'),
(6, 'Макс Корж - Эндорфин', 'music/MaxKorzh/Endorfin.mp3', '<p>Трек с пластинки «Жить в кайф», презентованой 2 ноября 2013 года Максом на Минск-Арене.<br> Впервые в музыкальной истории Белоруссии белорусский артист собрал самую крупную площадку страны,<br> вмещающую в себя 13 тысяч человек.</p>', 3, 'Хип-хоп', 1, 'Макс Корж', 'img/music/ZhitVKaif.jpg', 'Жить в Кайф'),
(7, 'Элджей - Рваный Джинсы', 'music/AllJ/Jeans.mp3', '<p>Элджей - рэп проект Алексея Узенюка. Алексей родился в Новосибирске, музыкой увлекался с детства.<br> За время своей музыкальной карьеры  успел выпустить 5 альбомов:<br> \"Пушка\", \"Библиотека\", \"Бошки дымятся\", \"Катакомбы\", \"SayonaraBoy\".</p>', 3, 'Хип-Хоп', 2, 'Элджей', 'img/author/authorAllJ.jpg', 'SayonaraBoy 3'),
(8, 'Элджей - Bounce', 'music/AllJ/Bounce.mp3', '<p>Элджей - рэп проект Алексея Узенюка. Алексей родился в Новосибирске, музыкой увлекался с детства.<br> За время своей музыкальной карьеры  успел выпустить 5 альбомов:<br> \"Пушка\", \"Библиотека\", \"Бошки дымятся\", \"Катакомбы\", \"SayonaraBoy\".</p>', 3, 'Хип-Хоп', 2, 'Элджей', 'img/author/authorAllJ.jpg', 'Сингл'),
(9, 'Элджей - ZEF', 'music/AllJ/ZEF.mp3', '<p>Элджей - рэп проект Алексея Узенюка. Алексей родился в Новосибирске, музыкой увлекался с детства.<br> За время своей музыкальной карьеры  успел выпустить 5 альбомов:<br> \"Пушка\", \"Библиотека\", \"Бошки дымятся\", \"Катакомбы\", \"SayonaraBoy\".</p>', 3, 'Хип-Хоп', 2, 'Элджей', 'img/author/authorAllJ.jpg', 'SayonaraBoy 3'),
(10, 'Элджей - Hey, guys', 'music/AllJ/Hey, guys.mp3', '<p>Элджей - рэп проект Алексея Узенюка. Алексей родился в Новосибирске, музыкой увлекался с детства.<br> За время своей музыкальной карьеры  успел выпустить 5 альбомов:<br> \"Пушка\", \"Библиотека\", \"Бошки дымятся\", \"Катакомбы\", \"SayonaraBoy\".</p>', 3, 'Хип-Хоп', 2, 'Элджей', 'img/author/authorAllJ.jpg', 'SayonaraBoy X'),
(11, 'Элджей - Ультрамариновые Танцы', 'music/AllJ/UltramarineDance.mp3', '<p>Элджей - рэп проект Алексея Узенюка. Алексей родился в Новосибирске, музыкой увлекался с детства.<br> За время своей музыкальной карьеры  успел выпустить 5 альбомов:<br> \"Пушка\", \"Библиотека\", \"Бошки дымятся\", \"Катакомбы\", \"SayonaraBoy\".</p>', 3, 'Хип-Хоп', 2, 'Элджей', 'img/author/authorAllJ.jpg', 'Сингл'),
(12, 'Элджей - Ecstasy', 'music/AllJ/Ecstasy.mp3', '<p>Элджей - рэп проект Алексея Узенюка. Алексей родился в Новосибирске, музыкой увлекался с детства.<br> За время своей музыкальной карьеры  успел выпустить 5 альбомов:<br> \"Пушка\", \"Библиотека\", \"Бошки дымятся\", \"Катакомбы\", \"SayonaraBoy\".</p>', 3, 'Хип-Хоп', 2, 'Элджей', 'img/author/authorAllJ.jpg', 'SayonaraBoy 3'),
(13, 'L’One - Все танцуют локтями', 'music/L’One/VseTancLoktyami.mp3', '<p>Автор главного танцевального хита 2013 года «Все танцуют локтями», Леван Горозия, он же L’One, родился в октябре 1985 года в Красноярске. Вскоре переехал с родителями в Якутск, который и стал для него родным городом. Грузин по национальности, он быстро стал заметной фигурой в Якутске – играл в баскетбол, в КВН, был даже ведущим провинциального турнира по КВНу.</p>', 3, 'Хип-Хоп', 3, 'L’One', 'img/author/authorLOne.png', 'Спутник'),
(14, 'L’One - Холодный, как лёд', 'music/L’One/Cold.mp3', '<p>Автор главного танцевального хита 2013 года «Все танцуют локтями», Леван Горозия, он же L’One, родился в октябре 1985 года в Красноярске. Вскоре переехал с родителями в Якутск, который и стал для него родным городом. Грузин по национальности, он быстро стал заметной фигурой в Якутске – играл в баскетбол, в КВН, был даже ведущим провинциального турнира по КВНу.</p>', 3, 'Хип-Хоп', 3, 'L’One', 'img/author/authorLOne.png', 'Восход - 1'),
(15, 'L’One - Тигр', 'music/L’One/Tiger.mp3', '<p>Автор главного танцевального хита 2013 года «Все танцуют локтями», Леван Горозия, он же L’One, родился в октябре 1985 года в Красноярске. Вскоре переехал с родителями в Якутск, который и стал для него родным городом. Грузин по национальности, он быстро стал заметной фигурой в Якутске – играл в баскетбол, в КВН, был даже ведущим провинциального турнира по КВНу.</p>', 3, 'Хип-Хоп', 3, 'L’One', 'img/author/authorLOne.png', 'Сингл'),
(16, 'L’One - Огонь и Вода', 'music/L’One/Fire.mp3', '<p>Автор главного танцевального хита 2013 года «Все танцуют локтями», Леван Горозия, он же L’One, родился в октябре 1985 года в Красноярске. Вскоре переехал с родителями в Якутск, который и стал для него родным городом. Грузин по национальности, он быстро стал заметной фигурой в Якутске – играл в баскетбол, в КВН, был даже ведущим провинциального турнира по КВНу.</p>', 3, 'Хип-Хоп', 3, 'L’One', 'img/author/authorLOne.png', 'Гравитация'),
(17, 'L’One - Валентинка', 'music/L’One/Valentinka.mp3', '<p>Автор главного танцевального хита 2013 года «Все танцуют локтями», Леван Горозия, он же L’One, родился в октябре 1985 года в Красноярске. Вскоре переехал с родителями в Якутск, который и стал для него родным городом. Грузин по национальности, он быстро стал заметной фигурой в Якутске – играл в баскетбол, в КВН, был даже ведущим провинциального турнира по КВНу.</p>', 3, 'Хип-Хоп', 3, 'L’One', 'img/author/authorLOne.png', 'Восход - 1'),
(18, 'L’One - День Рождения', 'music/L’One/HappyBirthday.mp3', '<p>Автор главного танцевального хита 2013 года «Все танцуют локтями», Леван Горозия, он же L’One, родился в октябре 1985 года в Красноярске. Вскоре переехал с родителями в Якутск, который и стал для него родным городом. Грузин по национальности, он быстро стал заметной фигурой в Якутске – играл в баскетбол, в КВН, был даже ведущим провинциального турнира по КВНу.</p>', 3, 'Хип-Хоп', 3, 'L’One', 'img/author/authorLOne.png', 'Спутник]'),
(19, '25/17 - Жду Чуда', 'music/25-17/ZhduChuda.mp3', '<p>25/17 - музыкальный проект родом из Омска, находящийся на стыке жанров альтернативного хип-хопа и рок-музыки. В составе Андрей \"Бледный\" и Антон \"Ант\". Ранее название: \"Иезекииль 25:17\". Это библейские строки, цитируемые героем Сэмюэла Джексона в фильме \"Криминальное Чтиво\": \"И совершу над ними великое мщение наказаниями яростными; и узнают, что Я Господь, когда совершу над ними Мое мщение\".</p>', 3, 'Хип-Хоп', 4, '25/17', 'img/author/25-17.jpg', 'Зебра'),
(20, '25/17 - Русская', 'music/25-17/Russkaya.mp3', '<p>25/17 - музыкальный проект родом из Омска, находящийся на стыке жанров альтернативного хип-хопа и рок-музыки. В составе Андрей \"Бледный\" и Антон \"Ант\". Ранее название: \"Иезекииль 25:17\". Это библейские строки, цитируемые героем Сэмюэла Джексона в фильме \"Криминальное Чтиво\": \"И совершу над ними великое мщение наказаниями яростными; и узнают, что Я Господь, когда совершу над ними Мое мщение\".</p>', 3, 'Хип-Хоп', 4, '25/17', 'img/author/25-17.jpg', 'Песни о Любви и Смерти'),
(21, '25/17 - Подорожник', 'music/25-17/Podorozhnik.mp3', '<p>25/17 - музыкальный проект родом из Омска, находящийся на стыке жанров альтернативного хип-хопа и рок-музыки. В составе Андрей \"Бледный\" и Антон \"Ант\". Ранее название: \"Иезекииль 25:17\". Это библейские строки, цитируемые героем Сэмюэла Джексона в фильме \"Криминальное Чтиво\": \"И совершу над ними великое мщение наказаниями яростными; и узнают, что Я Господь, когда совершу над ними Мое мщение\".</p>', 3, 'Хип-Хоп', 4, '25/17', 'img/author/25-17.jpg', 'Русский подорожник'),
(22, '25/17 - Песок', 'music/25-17/Pesok.mp3', '<p>25/17 - музыкальный проект родом из Омска, находящийся на стыке жанров альтернативного хип-хопа и рок-музыки. В составе Андрей \"Бледный\" и Антон \"Ант\". Ранее название: \"Иезекииль 25:17\". Это библейские строки, цитируемые героем Сэмюэла Джексона в фильме \"Криминальное Чтиво\": \"И совершу над ними великое мщение наказаниями яростными; и узнают, что Я Господь, когда совершу над ними Мое мщение\".</p>', 3, 'Хип-Хоп', 4, '25/17', 'img/author/25-17.jpg', 'Сингл'),
(23, '25/17 - Отец', 'music/25-17/Otec.mp3', '<p>25/17 - музыкальный проект родом из Омска, находящийся на стыке жанров альтернативного хип-хопа и рок-музыки. В составе Андрей \"Бледный\" и Антон \"Ант\". Ранее название: \"Иезекииль 25:17\". Это библейские строки, цитируемые героем Сэмюэла Джексона в фильме \"Криминальное Чтиво\": \"И совершу над ними великое мщение наказаниями яростными; и узнают, что Я Господь, когда совершу над ними Мое мщение\".</p>', 3, 'Хип-Хоп', 4, '25/17', 'img/author/25-17.jpg', 'Русский подорожник'),
(24, '25/17 - Моряк', 'music/25-17/Moryak.mp3', '<p>25/17 - музыкальный проект родом из Омска, находящийся на стыке жанров альтернативного хип-хопа и рок-музыки. В составе Андрей \"Бледный\" и Антон \"Ант\". Ранее название: \"Иезекииль 25:17\". Это библейские строки, цитируемые героем Сэмюэла Джексона в фильме \"Криминальное Чтиво\": \"И совершу над ними великое мщение наказаниями яростными; и узнают, что Я Господь, когда совершу над ними Мое мщение\".</p>', 3, 'Хип-Хоп', 4, '25/17', 'img/author/25-17.jpg', 'Ева едет в Вавилон');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `music`
--
ALTER TABLE `music`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `author`
--
ALTER TABLE `author`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `music`
--
ALTER TABLE `music`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
