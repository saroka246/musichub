<?php 
include_once "./templates/functions.php";
?>
<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script src="https://kit.fontawesome.com/ae40ad854b.js" crossorigin="anonymous"></script>
        <title>Каталог</title>
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
            <div class="wrapper">
                <div class="container">
                    <h1>Исполнители</h1>
                    <div class="main__content">
                        <?php 
                            author_loop($mysqli);
                        ?>
                    </div>
                    
                </div>
            </div>
            <div class="wrapper">
                <div class="container">
                    
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