<?php 
include_once "db.php"; 


//Функция вывода категорий для главной страницы
function cat_loop_mainpage ($mysqli, $num) {
    // SQL запрос для вывода категорий на главной
    $sql = "SELECT * FROM `categories`";
    // Отправляем SQL запрос
    $res = $mysqli -> query($sql);
    //не более 8 выведенных категорий на главной
    $i = 0;
    if ($res -> num_rows > 0) {
        // Вывод статьи
        while ($i < $num  && $resCat = $res -> fetch_assoc()) {
            $i++;
            ?>
            <a href="single-genre.php?id=<?= $resCat['id'] ?>" class="genre--card">
                <img src="<?= $resCat['cover'] ?>" alt="">
                <div class="genre--title"><?= $resCat['name'] ?></div>
            </a>
            <?php
        }
    } else {
        // Если нет категорий то выводим надпись
        echo "Нет категорий";
    }
}
//функция вывода категорий
function cat_loop ($mysqli) {
    // SQL запрос для вывода категорий
    $sql = "SELECT * FROM `categories`";
    // Отправляем SQL запрос
    $res = $mysqli -> query($sql);
    if ($res -> num_rows > 0) {
        // Вывод категории
        while ($resCat = $res -> fetch_assoc()) {
            ?>
            <a href="single-genre.php?id=<?= $resCat['id'] ?>" class="genre--card">
                <img src="<?= $resCat['cover'] ?>" alt="">
                <div class="genre--title"><?= $resCat['name'] ?></div>
            </a>
            <?php
        }
    } else {
        // Если нет категорий то выводим надпись
        echo "Нет категорий";
    }
}
//функция вывода исполнителей
function author_loop ($mysqli) {
    // SQL запрос для вывода исполнителей
    $sql = "SELECT * FROM `author` ORDER BY RAND() ";
    // Отправляем SQL запрос
    $res = $mysqli -> query($sql);
    if ($res -> num_rows > 0) {
        // Вывод статьи
        while ($resCat = $res -> fetch_assoc()) {
            ?>
            <a href="single-author.php?id=<?= $resCat['id'] ?>" class="genre--card">
                <img src="<?= $resCat['cover'] ?>" alt="">
                <div class="genre--title"><?= $resCat['name'] ?></div>
            </a>
            <?php
        }
    } else {
        // Если нет исполнителей то выводим надпись
        echo "Нет категорий";
    }
}
//вывод для шаблона отдельной категории
function single_cat ($mysqli, $id) {
    // SQL запрос для вывода музыки этой категории
    $sql = "SELECT * FROM `categories` WHERE `id` = '$id'";
    // SQL запрос для вывода исполнителей из этой категории
    $sql2 = "SELECT * FROM `author` WHERE `cat_id` = '$id'";
    // Отправляем SQL запрос
    $res = $mysqli -> query($sql);
    if ($res -> num_rows > 0) {
        // Вывод статьи
        while ($resCat = $res -> fetch_assoc()) {
            ?>
            <img src="<?= $resCat['cover'] ?>" alt="">
            <table width="350" border="1.5" bordercolor="#151515">
                <tr>
                    <td class="col">Жанр</td>
                    <td><?= $resCat['name'] ?></td>
                </tr>
                <tr>
                    <td class="col">Исполнители</td>
                    <td>
                    <?php
                    $res2 = $mysqli -> query($sql2);
                    if ($res2 -> num_rows > 0) {
                        while ($resCat2 = $res2 -> fetch_assoc()) {
                            ?>
                            <a href="single-author.php?id=<?= $resCat2['id'] ?>"><?= $resCat2['name'] ?></a>
                            <?php
                        }
                    }
                    ?>
                    </td>
                </tr>
            </table>
            <?= $resCat['content'] ?>
            <?php
        }
    } else {
        // Если нет статей то выводим надпись
        echo "Нет треков";
    }
}
//вывод для шаблона отдельного автора
function single_author ($mysqli, $id) {
    // SQL запрос для вывода страницы автора
    $sql = "SELECT * FROM `author` WHERE `id` = '$id'";
    // Отправляем SQL запрос
    $res = $mysqli -> query($sql);
    if ($res -> num_rows > 0) {
        // Вывод статьи
        while ($resCat = $res -> fetch_assoc()) {
            ?>
            <img src="<?= $resCat['cover'] ?>" alt="">
            <table width="350" border="1.5" bordercolor="#151515">
                <tr>
                    <td class="col">Исполнитель</td>
                    <td><?= $resCat['name'] ?></td>
                </tr>
                <tr>
                    <td class="col">Жанр</td>
                    <td><?= $resCat['cat_name'] ?></td>
                </tr>
            </table>
            <?= $resCat['content'] ?>
            <?php
        }
    } else {
        // Если нет инф
        echo "Нет категорий";
    }
}

//шаблон вывода страницы трека
function single_post ($mysqli, $id) {
    // SQL запрос для вывода отдельного трека
    $sql = "SELECT * FROM `music` WHERE `id` = '$id'";
    // Отправляем SQL запрос
    $res = $mysqli -> query($sql);
    if ($res -> num_rows > 0) {
        // Вывод страницы  трека
        while ($resPost = $res -> fetch_assoc()) {
            ?>
                        <div class="sidebar">
                            <img src="<?= $resPost['cover'] ?>" alt="">
                            <table width="350" border="1.5" bordercolor="#151515">
                                <tr>
                                    <td class="col">Исполнитель</td>
                                    <td><?= $resPost['author_name'] ?></td>
                                </tr>
                                <tr>
                                    <td class="col">Альбом</td>
                                    <td><?= $resPost['album'] ?></td>
                                </tr>
                                <tr>
                                    <td class="col">Жанр</td>
                                    <td><?= $resPost['cat_name'] ?></td>
                                </tr>
                            </table>
                        </div>
                        <div class="main">
                            <h4><?= $resPost['title'] ?></h4>
                            <?= $resPost['content'] ?>
                            <audio src="<?= $resPost['file_url'] ?>" type="audio/mpeg" controls="controls"></audio>
                        </div>
            <?php
        }
    } else {
        
        echo "Нет информации";
    }
}
// Цикл вывода постов/треков
function post_loop ($mysqli, $id, $num, $orderby) {
    // SQL запрос для вывода трека
    $sql = "SELECT * FROM `music` WHERE `$orderby` = '$id' ORDER BY RAND() ";
    $i = 0;
    // Отправляем SQL запрос
    $res = $mysqli -> query($sql);
    if ($res -> num_rows > 0) {
        // Вывод пост/статью
        while ($i < $num && $resPost = $res -> fetch_assoc()) {
            $i++;
            ?>
            <a href="single-post.php?id=<?= $resPost['id'] ?>" class="music--card">
                <h4><?= $resPost['title'] ?></h4>
                <audio src="<?= $resPost['file_url'] ?>" type="audio/mpeg" controls="controls"></audio>
            </a>
            <?php
        }
    } else {
        // Если нет статей то выводим надпись
        echo "Нет треков";
    }
}

