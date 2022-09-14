<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script src="https://kit.fontawesome.com/ae40ad854b.js" crossorigin="anonymous"></script>
        <title>Найденные результаты</title>
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
                    <?php 
                    $search_q=$_POST['search_q'];
                        $l= mysqli_connect('127.0.0.1', 'root', '', 'posts');
                        $search_q = trim($search_q);
                        $search_q = strip_tags($search_q);
                        $q= mysqli_query($l, "SELECT * FROM `music` WHERE title LIKE '%$search_q%' OR cat_name LIKE '%$search_q%' OR author_name LIKE '%$search_q%'");

                        
                    ?>
                    <h1>Найденоые результаты по Вашему запросу</h1>
                     <div class="container__search">
                       
                        <?php
                        
                        
                        while ($itog = mysqli_fetch_assoc($q)) {
                              ?>
                                <a href="single-post.php?id=<?= $itog['id'] ?>" class="music--card">
                                    <h4><?= $itog['title'] ?></h4>
                                    <audio src="<?= $itog['file_url'] ?>" type="audio/mpeg" controls="controls"></audio>
                                </a>
                              <?php  
                        }
                        mysqli_free_result($q);
                        mysqli_close($l);
                        ?>
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
