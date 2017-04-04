<!DOCTYPE html>
<html>
<head>
    <?php require 'blocks/head.php';?>
    <?php require 'blocks/angular_include.php';?>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC8sAuZK6C3DHJmuQuEyI1nzALdMTFNWow&libraries=places&sensor=false" async defer></script>

    <!--    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=false"></script>-->

</head>
<body ng-app="SektaFoodApp">
<?php require 'blocks/header.php';?>
<header class="enlarged">
    <div class="logophone wrap">
        <div class="logo"><a href="<?php echo BASE_URL;?>"><img alt="" src="<?php echo BASE_URL;?>templates/site/images/sektafood-logo.png" width="125"></a></div>
        <div class="phones">
            <p class="phone"><a href="tel:+79119260798">+7 911 926-07-98</a></p>
            <p class="slogan">ДОСТАВКА ЗДОРОВОЙ ЕДЫ</p>
        </div>
    </div>
</header>
<section class="blog-main">
    <div class="header">
        <h2>Контакты</h2>
    </div>
    <div class="text">
        <table>
            <tr>
                <td>Почта</td>
                <td><a href="mailto:info@sektafood.ru">info@sektafood.ru</a></td>
            </tr>
            <tr>
                <td>Телефон</td>
                <td><a href="tel:+79119260798">+7 911 926-07-98</a></td>
            </tr>
        </table>
    </div>
</section>

<?php require 'blocks/footer.php';?>

</body>
</html>