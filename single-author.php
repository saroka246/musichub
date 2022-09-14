<?php 
include_once "./templates/functions.php";
$id_genre = $_REQUEST["id"];
$sql = "SELECT * FROM `author` WHERE `id` = '$id_genre'";
$res = $mysqli -> query($sql);
$resCat = $res -> fetch_assoc();
?>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script src="https://kit.fontawesome.com/ae40ad854b.js" crossorigin="anonymous"></script>
        <title>Исполнитель: <?= $resCat['name'] ?></title>
    </head>
    <body>
        <header>
            <div class="wrapper">
                <div class="container header">
                    <div class="header__item logo">Music<span>Hub</span>
                    </div>
                    <ul class="header__item header__nav">
                        <li class="header__nav--item"><a href="index.php">Главная</a></li>
                        <li class="header__nav--item"><a href="#">Каталог</a></li>
                        <li class="header__nav--item"><a href="genres.php">Жанры</a></li>
                        <li class="header__nav--item"><a href="authors.php">Исполнители</a></li>
                        <li class="header__nav--item">
                            <form name="search" method="post" action="search.php" class="search">
                                <input type="search" name="search_q" placeholder="Найти...">
                                <input type="image" src="img/music_player_sign_musical_note_icon_123811.svg">
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
        <main>
            <div class="wrapper single">
                <div class="container">
                    <div class="content">
                        <div class="sidebar">
                            <?php 
                                single_author($mysqli, $id_genre);
                            ?>
                        </div>
                        <div class="main">
                            <h1>Треки исполнителя <?= $resCat['name'] ?></h1>
                            <div class="loop__music--card">
                                <?php 
                                    post_loop($mysqli, $id_genre, 6, 'author_id');
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer>
            <div class="wrapper">
                <div class="container">
                    <div class="header__item logo">Music<span>Hub</span></div>
                    <ul class="social">
                        <li><i class="fab fa-instagram"></i></li>
                        <li><i class="fab fa-vk"></i></li>
                        <li><i class="fab fa-facebook-square"></i></li>
                        <li><i class="fab fa-youtube"></i></li>
                        <li><i class="fab fa-snapchat-square"></i></li>
                    </ul>
                    <div class="copyright">©All rights reserved. 2021</div>
                </div>
            </div>
        </footer>
    </body>
</html>